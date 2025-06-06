<?php

class Activate extends BSDK {

    protected $url = 'https://api.bplugins.com/wp-json/data/v1/accept-data';
    protected $status = false;
    protected $post_type = '';
    protected $nonce = null;
    protected $last_check = null;
    protected $marketing_allowed = false;
    protected static $_instance = null;

    public function __construct($config, $__FILE__) {
        parent::__construct($config, $__FILE__);
        $this->register();
    }

    private function register() {
        $this->status = get_option("$this->prefix-opt_in", false);
        $this->last_check = get_option("$this->prefix-info-check", time() - 1);
        $this->marketing_allowed = get_option("$this->prefix-marketing-allowed", false);
        add_filter("plugin_action_links_$this->base_name", [$this, 'opt_in_button']);
        add_action("wp_ajax_$this->prefix-opt-in-update", [$this, 'opt_in_update']);
        add_action('admin_head', [$this, 'admin_head']);
        add_action('admin_enqueue_scripts', [$this, 'enqueue_assets']);

        if (!$this->status) {
            add_action('admin_menu', [$this, 'add_opt_in_menu']);
        }

        register_deactivation_hook($this->__FILE__, [$this, 'deactivate']);
        add_action('admin_footer', [$this, 'opt_in_modal']);
        add_action('admin_footer', [$this, 'initialize_opt_in']);
    }

    function initialize_opt_in() {
        ?>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                if (typeof bsdkOptInFormHandler === 'function') {
                    bsdkOptInFormHandler('<?php echo esc_html($this->prefix); ?>');
                }
            });
        </script>
        <?php
    }

    public function admin_head() {
        $request_uri = isset($_SERVER['REQUEST_URI']) ? sanitize_text_field(wp_unslash($_SERVER['REQUEST_URI'])) : '';

        if (!get_option("$this->prefix-redirect", false) &&
            strpos($request_uri, 'post.php') === false &&
            strpos($request_uri, 'post-new.php') === false) {
            update_option("$this->prefix-redirect", true);
            ?>
            <script>
                window.location.href = '<?php echo esc_url(admin_url("admin.php?page=" . dirname($this->base_name))); ?>';
            </script>
            <?php
        }
    }

    public function opt_in_update() {
        $nonce = isset($_POST['nonce']) ? sanitize_text_field(wp_unslash($_POST['nonce'])) : '';
        if (!wp_verify_nonce($nonce, 'wp_ajax')) {
            wp_send_json_error(['success' => false, 'message' => 'Invalid nonce'], 400);
            return;
        }

        $actionType = isset($_POST['actionType']) ? sanitize_text_field(wp_unslash($_POST['actionType'])) : '';
        $validActions = ['agree', 'skip', 'opt_out'];
        if (!in_array($actionType, $validActions, true)) {
            wp_send_json_error(['success' => false, 'message' => 'Invalid action type'], 400);
            return;
        }

        switch ($actionType) {
            case 'agree':
                update_option("$this->prefix-opt_in", 'agreed');
                update_option("$this->prefix-marketing-allowed", true);
                break;
            case 'skip':
                update_option("$this->prefix-opt_in", 'skipped');
                break;
            case 'opt_out':
                update_option("$this->prefix-marketing-allowed", false);
                break;
        }

        wp_send_json_success(['success' => true]);
    }

    public function opt_in_button($links) {
        $settings_link = '<a href="#" class="optInBtn" id="' . esc_attr($this->prefix . 'OptInBtn') . '" data-status="' . esc_attr($this->marketing_allowed ? 'agree' : 'not-allowed') . '">' . esc_html($this->marketing_allowed ? 'Opt out' : 'Opt In') . '</a>';
        array_unshift($links, $settings_link);
        return $links;
    }

    public function add_opt_in_menu() {
        add_submenu_page('', $this->plugin_name, $this->plugin_name, 'manage_options', dirname($this->base_name), [$this, 'opt_in_form']);
    }

     public function enqueue_assets($hook) {
    // Register the script with $in_footer set to true
    wp_register_script(
        "bsdk-opt-in",
        plugin_dir_url(plugin_dir_path(__DIR__)) . 'dist/opt-in-form.js',
        ['react', 'react-dom'], 
        $this->version, 
        true // Load in the footer
    );

    // Register the style
    wp_register_style(
        "bsdk-opt-in",
        plugin_dir_url(plugin_dir_path(__DIR__)) . 'dist/opt-in-form.css',
        [],
        $this->version
    );

    if ($hook === 'plugins.php' || $hook === "admin_page_" . dirname($this->base_name)) {
        // Enqueue the script and style
        wp_enqueue_script("bsdk-opt-in");
        wp_enqueue_style("bsdk-opt-in");
    }
}


    public function opt_in_form() {
        update_option("$this->prefix-redirect", true);
        ?>
        <div 
            data-basename="<?php echo esc_attr(dirname($this->base_name)); ?>"
            data-admin_url="<?php echo esc_url(admin_url()); ?>"
            data-ajax_url="<?php echo esc_url(admin_url('admin-ajax.php')); ?>"
            data-nonce="<?php echo esc_attr(wp_create_nonce('wp_ajax')); ?>"
            data-info="<?php echo esc_attr(wp_json_encode($this->getInfo())); ?>"
            id="<?php echo esc_attr($this->prefix); ?>OptInForm">
        </div>
        <?php
    }

    public function getInfo() {
        $user = wp_get_current_user();
        global $wp_version;

        return [
            'website' => esc_url_raw(site_url()),
            'user_email' => sanitize_email($user->user_email),
            'user_display_name' => sanitize_text_field($user->display_name),
            'user_nickname' => sanitize_text_field($user->user_login),
            'plugin_version' => sanitize_text_field($this->version),
            'php_version' => sanitize_text_field(phpversion()),
            'platform_version' => sanitize_text_field($wp_version),
            'plugin_slug' => sanitize_text_field(dirname($this->base_name)),
        ];
    }

    public function data_update($data = []) {
        $response = wp_remote_post($this->url, [
            'method' => 'POST',
            'timeout' => 45,
            'body' => wp_parse_args($data, $this->getInfo())
        ]);
    }

    public function activate() {
        if ($this->status == 'agreed') {
            $this->data_update(['status' => 'activate']);
        }
    }

    public function deactivate() {
        if ($this->status == 'agreed') {
            $this->data_update(['status' => 'deactivate']);
        }
    }

    public function opt_in_modal($hook) {
        $screen = \get_current_screen();
        if ($screen->base === 'plugins') {
            ?>
            <div id="<?php echo esc_attr($this->prefix); ?>OptInModal"
                data-basename="<?php echo esc_attr(dirname($this->base_name)); ?>"
                data-path="<?php echo esc_url(plugin_dir_url(plugin_dir_path(__DIR__))); ?>"
                data-admin_url="<?php echo esc_url(admin_url()); ?>"
                data-ajax_url="<?php echo esc_url(admin_url('admin-ajax.php')); ?>"
                data-nonce="<?php echo esc_attr(wp_create_nonce('wp_ajax')); ?>"
                data-info="<?php echo esc_attr(wp_json_encode($this->getInfo())); ?>">
            </div>
            <?php
        }
    }
}
