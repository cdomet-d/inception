<?php
/**
 * Plugin Name: Embed Repo For Github
 * Description: Embed your GitHub repositories on WordPress.
 * Version: 1.0.6
 * Author: bPlugins
 * Author URI: http://bplugins.com
 * License: GPLv3
 * License URI: https://www.gnu.org/licenses/gpl-3.0.txt
 * Text Domain: embed-github
 */

// ABS PATH
if (!defined('ABSPATH')) {exit;}

// Constant
define( 'GHB_PLUGIN_VERSION', isset( $_SERVER['HTTP_HOST'] ) && 'localhost' === $_SERVER['HTTP_HOST'] ? time() : '1.0.6' );
define('GHB_ASSETS_DIR', plugin_dir_url(__FILE__) . 'assets/');

if (!function_exists('ghb_init')) {
    function ghb_init()
    {
        global $ghb_bs;
        require_once plugin_dir_path(__FILE__) . 'bplugins_sdk/init.php';
        $ghb_bs = new BPlugins_SDK(__FILE__);
    }
    ghb_init();
} else {
    $ghb_bs->uninstall_plugin(__FILE__);
}

//  Embed Github
class GHBEmbedGithub
{
    public function __construct()
    {
        add_action('enqueue_block_assets', [$this, 'enqueueBlockAssets']);
        add_action('init', [$this, 'onInit']);
    }

    public function enqueueBlockAssets()
    {

        wp_register_style('ghb-github-style', plugins_url('dist/style.css', __FILE__), [], GHB_PLUGIN_VERSION);

        wp_register_script('ghb-github-script', plugins_url('dist/script.js', __FILE__), ['react', 'react-dom'], GHB_PLUGIN_VERSION, true);

    }

    public function onInit()
    {
        wp_register_style('ghb-github-editor-style', plugins_url('dist/editor.css', __FILE__), ['ghb-github-style'], GHB_PLUGIN_VERSION); // Backend Style

        register_block_type(__DIR__, [
            'editor_style' => 'ghb-github-editor-style',
            'render_callback' => [$this, 'render'],
        ]); // Register Block

        wp_set_script_translations('ghb-github-editor-script', 'embed-github', plugin_dir_path(__FILE__) . 'languages'); // Translate
    }

    public function render($attributes)
    {
        extract($attributes);

        $className = $className ?? '';
        $ghbBlockClassName = 'wp-block-ghb-github' . $className . ' align' . $align;

        wp_enqueue_style('ghb-github-style');
        wp_enqueue_script('ghb-github-script');

        ob_start();?>
		<div class='<?php echo esc_attr($ghbBlockClassName); ?>' id='ghbMainArea-<?php echo esc_attr($cId) ?>' data-attributes='<?php echo esc_attr(wp_json_encode($attributes)); ?>'></div>

		<?php return ob_get_clean();
    } // Render
}
new GHBEmbedGithub();