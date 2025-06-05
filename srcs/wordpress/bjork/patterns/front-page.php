<?php
/**
 * Title: front-page
 * Slug: bjork/front-page
 * Inserter: no
 */
?>
<!-- wp:template-part {"slug":"header","tagName":"header","className":"site-header"} /-->

<!-- wp:group {"style":{"spacing":{"margin":{"top":"0","bottom":"0"}}},"layout":{"inherit":true,"type":"constrained"}} -->
<div class="wp-block-group" style="margin-top:0;margin-bottom:0"><!-- wp:columns {"align":"wide","style":{"spacing":{"margin":{"bottom":"0px"}}}} -->
<div class="wp-block-columns alignwide" style="margin-bottom:0px"><!-- wp:column {"width":"23%","className":"site-sidebar-col"} -->
<div class="wp-block-column site-sidebar-col" style="flex-basis:23%"><!-- wp:template-part {"slug":"sidebar","tagName":"aside","className":"site-sidebar"} /--></div>
<!-- /wp:column -->

<!-- wp:column {"width":"77%"} -->
<div class="wp-block-column" style="flex-basis:77%"><!-- wp:group {"tagName":"main","layout":{"inherit":true,"type":"constrained"}} -->
<main class="wp-block-group"><!-- wp:cover {"dimRatio":0,"overlayColor":"quaternary","isUserOverlayColor":true,"minHeight":90,"minHeightUnit":"vh","isDark":false,"align":"wide","style":{"spacing":{"padding":{"top":"0vh","right":"0vh","bottom":"0vh","left":"0vh"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-cover alignwide is-light" style="padding-top:0vh;padding-right:0vh;padding-bottom:0vh;padding-left:0vh;min-height:90vh"><span aria-hidden="true" class="wp-block-cover__background has-quaternary-background-color has-background-dim-0 has-background-dim"></span><div class="wp-block-cover__inner-container"><!-- wp:group {"align":"wide","style":{"spacing":{"padding":{"bottom":"0vh","top":"0vh"},"blockGap":"2rem"}},"textColor":"foreground"} -->
<div class="wp-block-group alignwide has-foreground-color has-text-color" style="padding-top:0vh;padding-bottom:0vh"><!-- wp:heading {"level":1,"style":{"spacing":{"margin":{"top":"0px"}}},"textColor":"secondary","fontSize":"extra-large"} -->
<h1 class="wp-block-heading has-secondary-color has-text-color has-extra-large-font-size" style="margin-top:0px">Hi there!
							</h1>
<!-- /wp:heading -->

<!-- wp:heading {"level":1} -->
<h1 class="wp-block-heading">My name is Coralie and this is my website.</h1>
<!-- /wp:heading -->

<!-- wp:media-text {"mediaId":66,"mediaType":"image"} -->
<div class="wp-block-media-text is-stacked-on-mobile"><figure class="wp-block-media-text__media"><img src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/images/rsz_122_sandrine-min-1-edited-1024x768.png" alt="profesionnal shot of cdomet-d" class="wp-image-66 size-full"/></figure><div class="wp-block-media-text__content"><!-- wp:paragraph {"placeholder":"Content…"} -->
<p>I used to be a makeup artist, but I've decided I like computer science more. You can learn more about me below.</p>
<!-- /wp:paragraph --></div></div>
<!-- /wp:media-text -->

<!-- wp:buttons {"style":{"spacing":{"blockGap":"1em"}},"layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons"><!-- wp:button {"textColor":"primary","className":"is-style-outline"} -->
<div class="wp-block-button is-style-outline"><a class="wp-block-button__link has-primary-color has-text-color wp-element-button" href="https://cdomet-d.42.fr/?page_id=119" rel="nofollow">About
										Me</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group --></div></div>
<!-- /wp:cover -->

<!-- wp:separator {"className":"is-style-bjork-angled-separator-wide","backgroundColor":"tertiary"} -->
<hr class="wp-block-separator has-text-color has-tertiary-color has-alpha-channel-opacity has-tertiary-background-color has-background is-style-bjork-angled-separator-wide"/>
<!-- /wp:separator -->

<!-- wp:columns {"align":"wide"} -->
<div class="wp-block-columns alignwide"><!-- wp:column {"backgroundColor":"quaternary","textColor":"foreground"} -->
<div class="wp-block-column has-foreground-color has-quaternary-background-color has-text-color has-background"><!-- wp:image {"sizeSlug":"full","linkDestination":"none","style":{"border":{"radius":{"topLeft":"0px","topRight":"0px","bottomLeft":"0px","bottomRight":"0px"}}}} -->
<figure class="wp-block-image size-full has-custom-border"><img src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/images/mail.jpg" alt="" class="" style="border-top-left-radius:0px;border-top-right-radius:0px;border-bottom-left-radius:0px;border-bottom-right-radius:0px"/></figure>
<!-- /wp:image -->

<!-- wp:group {"style":{"spacing":{"margin":{"top":"0px","bottom":"0px"},"blockGap":"1.5rem"}},"backgroundColor":"quaternary"} -->
<div class="wp-block-group has-quaternary-background-color has-background" style="margin-top:0px;margin-bottom:0px"><!-- wp:heading {"textAlign":"left","level":6,"style":{"typography":{"lineHeight":"1"}}} -->
<h6 class="wp-block-heading has-text-align-left" id="my-story" style="line-height:1">Reach out</h6>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"left","fontSize":"small"} -->
<p class="has-text-align-left has-small-font-size">Curious about anything? Reach out !</p>
<!-- /wp:paragraph -->

<!-- wp:buttons {"layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons"><!-- wp:button {"backgroundColor":"foreground","fontSize":"tiny"} -->
<div class="wp-block-button"><a class="wp-block-button__link has-foreground-background-color has-background has-tiny-font-size has-custom-font-size wp-element-button" href="http://mailto:cdomet-d@student.42lyon.fr">s(hoot) me an email</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group --></div>
<!-- /wp:column -->

<!-- wp:column {"backgroundColor":"quaternary","textColor":"foreground"} -->
<div class="wp-block-column has-foreground-color has-quaternary-background-color has-text-color has-background"><!-- wp:image {"sizeSlug":"full","linkDestination":"none","style":{"border":{"radius":{"topLeft":"0px","topRight":"0px","bottomLeft":"0px","bottomRight":"0px"}}}} -->
<figure class="wp-block-image size-full has-custom-border"><img src="<?php echo esc_url( get_template_directory_uri() ); ?>/assets/images/CODING.jpg" alt="" class="" style="border-top-left-radius:0px;border-top-right-radius:0px;border-bottom-left-radius:0px;border-bottom-right-radius:0px"/></figure>
<!-- /wp:image -->

<!-- wp:group {"style":{"spacing":{"blockGap":"1.5rem","margin":{"top":"0px","bottom":"0px"}}},"backgroundColor":"quaternary"} -->
<div class="wp-block-group has-quaternary-background-color has-background" style="margin-top:0px;margin-bottom:0px"><!-- wp:heading {"textAlign":"left","level":6,"style":{"typography":{"lineHeight":"1"}}} -->
<h6 class="wp-block-heading has-text-align-left" id="my-story" style="line-height:1">Projects</h6>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"left","fontSize":"small"} -->
<p class="has-text-align-left has-small-font-size">I have done some stuff, mostly school projects. </p>
<!-- /wp:paragraph -->

<!-- wp:buttons {"layout":{"type":"flex","justifyContent":"center"}} -->
<div class="wp-block-buttons"><!-- wp:button {"backgroundColor":"foreground","fontSize":"tiny"} -->
<div class="wp-block-button"><a class="wp-block-button__link has-foreground-background-color has-background has-tiny-font-size has-custom-font-size wp-element-button" href="https://github.com/cdomet-d">look them up on github</a></div>
<!-- /wp:button --></div>
<!-- /wp:buttons --></div>
<!-- /wp:group --></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></main>
<!-- /wp:group -->

<!-- wp:template-part {"slug":"footer","tagName":"footer","className":"site-footer"} /--></div>
<!-- /wp:column --></div>
<!-- /wp:columns --></div>
<!-- /wp:group -->