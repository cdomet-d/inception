<?php

class BSDKLicense extends BSDK {

    protected $permalinks = [];
    
    function __construct($config, $__FILE__) {
        parent::__construct($config, $__FILE__);
        $this->permalinks = $config->permalinks;
        $this->register();
    }
    
    public function register() {
        add_action('admin_footer', [$this, 'form']);
        add_action('admin_enqueue_scripts', [$this, 'admin_enqueue_scripts']);
        add_filter("plugin_action_links_$this->base_name", [$this, 'addButtonInPlugin']);
        add_action("wp_ajax_{$this->prefix}_active_license_key", [$this, 'activeLicense']);
        add_action("wp_ajax_{$this->prefix}_sync_license_key", [$this, 'ajaxSyncLicense']);
        add_action('admin_footer', [$this, 'admin_footer']);
    }

    public function activeLicense() {
        if (!isset($_POST['nonce']) || !wp_verify_nonce(sanitize_text_field(wp_unslash($_POST['nonce'])), 'wp_ajax')) {
            echo wp_json_encode(['success' => false, 'message' => 'Invalid nonce']);
            wp_die();
            return;
        }

        $data = isset($_POST['data']) ? sanitize_text_field(wp_unslash($_POST['data'])) : "{}";

        if (!is_string($data) || empty($data)) {
            echo wp_json_encode(['success' => false, 'message' => 'Invalid data format']);
            wp_die();
            return;
        }

        $result = update_option($this->prefix . "_pipe", $data);
        echo wp_json_encode(['success' => $result]);
        wp_die();
    }

    public function addButtonInPlugin($links) {
        $text = get_option($this->prefix . "_pipe", false) || !$this->config->isBlock
            ? ($this->isPipe ? __('Deactivate License', 'embed-github') : __('Activate License', 'embed-github'))
            : __('Upgrade to Pro', 'embed-github');

        $settings_link = '<a href="#" class="' . esc_attr($this->prefix . '_modal_opener') . '">' . esc_html($text) . '</a>';
        array_unshift($links, $settings_link);
        return $links;
    }

    public function admin_enqueue_scripts($page) {
        if ($page === 'plugins.php') {
            wp_register_script('bsdk-license', plugin_dir_url(plugin_dir_path(__DIR__)) . 'dist/license.js', ['wp-api'], WP_B__VERSION, true);
            wp_register_style('bsdk-license', plugin_dir_url(plugin_dir_path(__DIR__)) . 'dist/license.css', [], WP_B__VERSION, 'all');

            wp_localize_script('bsdk-license', 'BSDK', [
                'ajaxURL' => admin_url('admin-ajax.php'),
                'website' => site_url(),
                'email' => get_option('admin_email'),
                'nonce' => wp_create_nonce('wp_ajax'),
            ]);
        }
    }

     public function form() {
    $screen = get_current_screen();
    if ($screen->base === 'plugins') {
        ?>
        <div class="<?php echo esc_attr($this->prefix); ?>_license_popup">
            <div id="bLicensePopup" class="popupWrapper">
                <div class="overlay"></div>
                <div class="license_form">
                    <div class="popup_header">
                        <h2><?php esc_html_e("Activate License", "embed-github"); ?></h2>
                        <span class="closer">&times;</span>
                    </div>
                    <div class="popup_body">
                        <p><?php esc_html_e('Please enter the license key you received after purchase:', 'embed-github'); ?></p>
                        <input type="<?php echo esc_attr($this->_upgraded ? 'password' : 'text'); ?>" 
                               value="<?php echo esc_attr($this->key); ?>" 
                               class="license_key" 
                               name="<?php echo esc_attr($this->prefix) . '-license-key'; ?>" />
                        <div class="license_notice"></div>
                        <div class="terms">
                            <input type="checkbox" id="agreeField" class="input agree">
                            <label for="agreeField">
                                <?php 
                                $this->isPipe ? 
                                    esc_html_e("Remove Data", 'embed-github') : 
                                    esc_html_e("I agree to send website URL, email, and License key to verify the license.", 'embed-github');
                                ?>
                            </label>
                        </div>
                    </div>
                    <div class="popup_footer">
                        <span class="bpl_loader"></span>
                        <?php if ($this->isPipe): ?>
                            <input type="submit" class="button button-primary btn-deactivate" 
                                   value="<?php esc_attr_e("Deactivate License", "embed-github"); ?>" />
                        <?php else: ?>
                            <input type="submit" disabled class="button button-primary btn-activate" 
                                   value="<?php esc_attr_e("Activate License", "embed-github"); ?>" />
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        </div>
        <?php
    }
}


    public function admin_footer() {
        $screen = (array) get_current_screen();
        if (isset($screen['base']) && $screen['base'] === 'plugins') {
            wp_enqueue_script('bsdk-license');
            wp_enqueue_style('bsdk-license');
            ?>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    if (typeof LicenseHandler === 'function') {
                        const license = new LicenseHandler(
                            '<?php echo esc_js($this->prefix); ?>', 
                            <?php echo wp_json_encode($this->permalinks); ?>
                        );
                        license.initialize();
                    }
                });
            </script>
            <?php
        }

        if ($this->blockHandler) {
            wp_enqueue_script('bsdk-license');
        }
    }

     public function syncLicense() {
    // Verify nonce
    if (!isset($_POST['nonce']) || !wp_verify_nonce(sanitize_text_field(wp_unslash($_POST['nonce'])), 'wp_ajax')) {
        wp_send_json_error(['message' => 'Invalid nonce'], 400);
        return;
    }

    // Handle the website parameter
    if (isset($_POST['website'])) {
        $website = esc_url_raw(wp_unslash($_POST['website']));
        // Validate the website URL
        if (filter_var($website, FILTER_VALIDATE_URL) === false) {
            wp_send_json_error(['message' => 'Invalid website URL'], 400);
            return;
        }
    } else {
        $website = esc_url_raw(home_url());
    }

    $response = ['success' => false];

    if ($this->isPipe) {
        $api_url = sprintf(
            "https://api.bplugins.com/wp-json/license/v1/sync-license?website=%s&product=%s&time=%d",
            rawurlencode($website),
            rawurlencode($this->prefix),
            time()
        );

        $remote_response = wp_remote_get($api_url);

        if (is_wp_error($remote_response)) {
            wp_send_json_error(['message' => 'Error connecting to license server'], 500);
            return;
        }

        $response = json_decode(wp_remote_retrieve_body($remote_response), true);
    }

    // Update the option if response indicates failure
    if (isset($response['success']) && !$response['success']) {
        update_option($this->prefix . "_pipe", "{}");
    }

    wp_send_json($response);
}


    public function ajaxSyncLicense() {
        $response = $this->syncLicense();
        echo wp_json_encode($response);
        wp_die();
    }
}
