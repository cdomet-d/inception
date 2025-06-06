import { __ } from '@wordpress/i18n';

import icons from './icons';

const options = {
	layoutOpt: [
		{ label: 'Default', value: 'default' },
		{ label: 'Masonry', value: 'masonry' }
	],
	infoOption: [
		{ label: 'Logo', value: 'logo' },
		{ label: 'Name', value: 'name' },
		{ label: 'Description', value: 'desc' },
		{ label: 'Download', value: 'download' },
		{ label: 'Topic', value: 'topic' },
	],
	layouts: [
		{ label: __('Vertical', 'block-directory'), value: 'vertical', icon: icons.verticalLine },
		{ label: __('Horizontal', 'block-directory'), value: 'horizontal', icon: icons.horizontalLine }
	],

	generalStyleTabs: [
		{ name: 'general', title: __('General', 'block-directory') },
		{ name: 'style', title: __('Style', 'block-directory') }
	],

	pxUnit: (def = 0) => ({ value: 'px', label: 'px', default: def }),
	perUnit: (def = 0) => ({ value: '%', label: '%', default: def }),
	emUnit: (def = 0) => ({ value: 'em', label: 'em', default: def }),
	remUnit: (def = 0) => ({ value: 'rem', label: 'rem', default: def }),
	vwUnit: (def = 0) => ({ value: 'vw', label: 'vw', default: def }),
	vhUnit: (def = 0) => ({ value: 'vh', label: 'vh', default: def }),

	dUnit: (def = 0, value = "px", label) => ({ value, label: label || value, default: def }),
}
export default options;