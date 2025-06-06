
import { getBoxValue } from './Const/functions';
import { getBackgroundCSS, getBorderCSS, getTypoCSS, getColorsCSS } from '../../Components/utils/getCSS';
const Style = ({ attributes, clientId }) => {
	const { columnGap, rowGap, background, padding, cardBG, cardPadding, cardBorder, nameTypo, nameColor, descTypo, descColor, downloadBtnTypo, downloadBtnColors, downloadBtnPadding, downloadBtnBorder, pageBtnTypo, pageBtnColors, pageBtnActiveColors, pageBtnBorder, modalBtnTypo, modalBtnColors, modalBtnHoverColors, modalBtnBorder, modalBtnHoverBorder, modalBtnPadding } = attributes;

	const MainEl = `#ghbMainArea-${clientId}`;
	const mainSection = `${MainEl} .ghbSectionArea`;

	return <style dangerouslySetInnerHTML={{
		__html: `
		${getTypoCSS('', nameTypo)?.googleFontLink}
		${getTypoCSS('', descTypo)?.googleFontLink}
		${getTypoCSS('', downloadBtnTypo)?.googleFontLink}
		${getTypoCSS('', pageBtnTypo)?.googleFontLink}
		 
		${getTypoCSS('', modalBtnTypo)?.googleFontLink}
		${getTypoCSS(`${mainSection} .ghbSingleRepoCard .name`, nameTypo)?.styles}
		${getTypoCSS(`${mainSection} .ghbSingleRepoCard .desc`, descTypo)?.styles}
		${getTypoCSS(`${mainSection} .ghbSingleRepoCard .download`, downloadBtnTypo)?.styles}
		${getTypoCSS(`${mainSection} .ghbSingleRepoCard .topic`, downloadBtnTypo)?.styles}
		${getTypoCSS(`${mainSection} .pagination button`, pageBtnTypo)?.styles}
		 
		${getTypoCSS(`${mainSection} .modalSection button`, modalBtnTypo)?.styles}
		
		${mainSection} {
			${getBackgroundCSS(background)};
			padding:${getBoxValue(padding)};
		}

		${MainEl} .ghbMainArea{
			grid-gap: ${rowGap} ${columnGap};	 
		}

		${mainSection} .ghbSingleRepo .ghbSingleRepoCard{
			${getBackgroundCSS(cardBG)};
			padding:${getBoxValue(cardPadding)};
			${getBorderCSS(cardBorder)};
		}

		${mainSection} .ghbSingleRepoCard .name {
			color:${nameColor};
		}
		${mainSection} .ghbSingleRepoCard .desc {
			color:${descColor};
		}
		${mainSection} .ghbSingleRepoCard .download,
		${mainSection} .ghbSingleRepoCard .topic {
			${getColorsCSS(downloadBtnColors)};
			padding:${getBoxValue(downloadBtnPadding)};
			${getBorderCSS(downloadBtnBorder)};
		}

		${mainSection} .pagination button { 
			${getColorsCSS(pageBtnColors)};
			${getBorderCSS(pageBtnBorder)};
		}

		${mainSection} .pagination .active { 
			${getColorsCSS(pageBtnActiveColors)};
		}

		${mainSection} .modalSection button {
			${getColorsCSS(modalBtnColors)};
			${getBorderCSS(modalBtnBorder)};
			padding:${getBoxValue(modalBtnPadding)};
		}

		${mainSection} .modalSection button:hover {
			${getBorderCSS(modalBtnHoverBorder)};
		}

		${mainSection} .modalSection > button.ghbModalBtn::after {
			${getColorsCSS(modalBtnHoverColors)};
		}

		`.replace(/\s+/g, ' ')
	}} />;
}
export default Style;