import { __ } from '@wordpress/i18n';
import { produce } from 'immer';
import { InspectorControls } from '@wordpress/block-editor';
import { PanelBody, PanelRow, TabPanel, ToggleControl, RangeControl, __experimentalUnitControl as UnitControl, __experimentalBoxControl as BoxControl, Button, __experimentalInputControl as InputControl, Dashicon, SelectControl } from '@wordpress/components';

// Settings Components
import { Label, BDevice, Background, Typography, BColor, ColorsControl, BorderControl, HelpPanel } from '../../Components';


import { tabController } from './Const/functions';
import icons from './Const/icons';
import options from './Const/options';
import { useState, useEffect } from '@wordpress/element';

const { generalStyleTabs, pxUnit, perUnit, emUnit, layoutOpt } = options;

const Settings = ({ attributes, setAttributes, setRepos, handleFetchData }) => {
	const { columns, columnGap, rowGap, userName, elements, query, background, padding, cardBG, cardPadding, cardBorder, githubIcon, nameTypo, nameColor, descTypo, descColor, downloadBtnTypo, downloadBtnColors, downloadBtnPadding, downloadBtnBorder, pageBtnTypo, pageBtnColors, pageBtnActiveColors, pageBtnBorder, modalBtnTypo, modalBtnColors, modalBtnHoverColors, modalBtnBorder, modalBtnHoverBorder, modalBtnPadding, layout } = attributes;

	const { logo, repoName, desc, download, topic, pagination, masonry } = elements;
	const { postsPerPage } = query;
	const [device, setDevice] = useState('desktop');

	// Object attr update
	const updateObject = (attr, key, val) => {
		const newAttr = { ...attributes[attr] };
		newAttr[key] = val;
		setAttributes({ [attr]: newAttr })
	}

	useEffect(() => {
		icons.github2(githubIcon.size);
		icons.github2(githubIcon.color);
	}, [githubIcon]);

	return <>
		<InspectorControls>
			<TabPanel className='bPlTabPanel ghbTabPanel' activeClass='activeTab' tabs={generalStyleTabs} onSelect={() => tabController()}>{tab => <>
				{'general' === tab.name && <>

					<HelpPanel slug="embed-github" docsLink="https://bplugins.com/docs/embed-github-docs" />

					<PanelBody className='bPlPanelBody' title={__('Github Username', 'embed-github')} initialOpen={false}>
						<PanelRow className='gap10'>
							<InputControl className="ghbInput" label="" value={userName} onChange={val => {
								setAttributes({ userName: val }),
									setRepos([]);
							}} />

							<Button className='ghbBtn' variant='scondary' onClick={handleFetchData} disabled={!userName.trim()}>{__('Fetch Data', 'embed-github')}</Button>
						</PanelRow>

					</PanelBody>

					<PanelBody className='bPlPanelBody' title={__('Repositories Info', 'embed-github')} initialOpen={false}>

						<ToggleControl label={__('Logo', 'embed-github')} className='mt20' checked={logo} onChange={(val) => { setAttributes({ elements: { ...elements, logo: val } }); }} />

						<ToggleControl label={__('Name', 'embed-github')} className='mt20' checked={repoName} onChange={(val) => { setAttributes({ elements: { ...elements, repoName: val } }); }} />

						<ToggleControl label={__('Description', 'embed-github')} className='mt20' checked={desc} onChange={(val) => { setAttributes({ elements: { ...elements, desc: val } }); }} />

						<ToggleControl label={__('Download Button', 'embed-github')} className='mt20' checked={download} onChange={(val) => { setAttributes({ elements: { ...elements, download: val } }); }} />

						<ToggleControl label={__('Topic', 'embed-github')} className='mt20' checked={topic} onChange={(val) => { setAttributes({ elements: { ...elements, topic: val } }); }} />

					</PanelBody>

					<PanelBody className='bPlPanelBody' title={__('Pagination', 'embed-github')} initialOpen={false}>

						<ToggleControl label={__('Pagination', 'embed-github')} className='mt20' checked={pagination} onChange={(val) => { updateObject('elements', 'pagination', val) }} />

						<Label>{__('Repositories  Per Page', 'embed-github')}</Label>
						<RangeControl className='' value={postsPerPage} onChange={val =>
							updateObject('query', 'postsPerPage', val)}
							min={1} max={20} step={1} />

					</PanelBody>

					<PanelBody className='bPlPanelBody' title={__('Layout', 'embed-github')} initialOpen={false}>

						<SelectControl label={__('Select Layout')} options={layoutOpt} value={layout} onChange={val => setAttributes({ layout: val })} />



						{/* column Gap  */}
						<UnitControl className='mt20' label={__('Column Gap:', 'embed-github')} labelPosition='left' value={columnGap} onChange={val => setAttributes({ columnGap: val })} units={[pxUnit(30), perUnit(3), emUnit(2)]} isResetValueOnUnitChange={true} />

						{/* row Gap  */}
						<UnitControl className='mt20' label={__('Row Gap:', 'embed-github')} labelPosition='left' value={rowGap} onChange={val => setAttributes({ rowGap: val })} units={[pxUnit(40), perUnit(3), emUnit(2.5)]} isResetValueOnUnitChange={true} />

						{/* column define option  */}
						<PanelRow className='mt20'>
							<Label mt='0'>{__('Columns:', 'embed-github')}</Label>
							<BDevice device={device} onChange={val => setDevice(val)} />
						</PanelRow>

						<RangeControl value={columns[device]} onChange={val => { setAttributes({ columns: { ...columns, [device]: val } }) }} min={1} max={6} step={1} beforeIcon='grid-view' />
					</PanelBody>

				</>}

				{'style' === tab.name && <>

					<PanelBody className='bPlPanelBody' title={__('Wrapper', 'embed-github')} initialOpen={false}>
						<Background className='mb20' label={__('Background:', 'embed-github')} value={background} onChange={val => setAttributes({ background: val })} />

						<BoxControl label={__('Padding', 'embed-github')} values={padding} onChange={val => setAttributes({ padding: val })} resetValues={{ top: 0, right: 0, bottom: 0, left: 0 }} units={[pxUnit(3), emUnit(2)]} />
					</PanelBody>

					<PanelBody className='bPlPanelBody' title={__('Card', 'embed-github')} initialOpen={false}>
						<Background className='mb20' label={__('Background:', 'embed-github')} value={cardBG} onChange={val => setAttributes({ cardBG: val })} />

						<BoxControl className='mb20' label={__('Padding', 'embed-github')} values={cardPadding} onChange={val => setAttributes({ cardPadding: val })} resetValues={{ top: 0, right: 0, bottom: 0, left: 0 }} units={[pxUnit(3), emUnit(2)]} />

						<BorderControl className='mt20' label={__('Border', 'embed-github')} value={cardBorder} onChange={(val) => setAttributes({ cardBorder: val })} />
					</PanelBody>

					{logo && <>
						<PanelBody className='bPlPanelBody' title={__('Icon', 'embed-github')} initialOpen={false}>

							<Label className='mt10'>{__('Size', 'embed-github')}</Label>
							<RangeControl value={githubIcon.size} onChange={(value) => {
								updateObject('githubIcon', 'size', value)
							}} min={1} max={100} />

							<BColor className='mt20' label={__('Color', 'embed-github')} value={githubIcon.color}
								onChange={val => setAttributes({ githubIcon: { ...githubIcon, color: val } })} defaultColor='#fff' />
						</PanelBody>
					</>}

					{repoName && <>
						<PanelBody className='bPlPanelBody' title={__('Name', 'embed-github')} initialOpen={false}>
							<Typography className='mt10' label={__('Typography', 'embed-github')} value={nameTypo} onChange={val => setAttributes({ nameTypo: val })} produce={produce} />

							<BColor label={__('Color', 'embed-github')} value={nameColor}
								onChange={val => setAttributes({ nameColor: val })} />
						</PanelBody>
					</>}

					{desc && <>
						<PanelBody className='bPlPanelBody' title={__('Description', 'embed-github')} initialOpen={false}>
							<Typography className='mt10' label={__('Typography', 'embed-github')} value={descTypo} onChange={val => setAttributes({ descTypo: val })} produce={produce} />

							<BColor label={__('Color', 'embed-github')} value={descColor}
								onChange={val => setAttributes({ descColor: val })} />
						</PanelBody>
					</>}

					{(download && topic) && <>
						<PanelBody className='bPlPanelBody' title={__('Download Button & Topic', 'embed-github')} initialOpen={false}>

							<Typography className='mt10' label={__('Typography', 'embed-github')} value={downloadBtnTypo} onChange={val => setAttributes({ downloadBtnTypo: val })} produce={produce} />

							<ColorsControl className='mb20' label={__('Colors', 'embed-github')} value={downloadBtnColors} onChange={val => setAttributes({ downloadBtnColors: val })} />

							<BoxControl label={__('Padding', 'embed-github')} values={downloadBtnPadding} onChange={val => setAttributes({ downloadBtnPadding: val })} resetValues={{ top: 0, right: 0, bottom: 0, left: 0 }} units={[pxUnit(3), emUnit(2)]} />

							<BorderControl className='mt10' label={__('Border', 'embed-github')} value={downloadBtnBorder} onChange={(val) => setAttributes({ downloadBtnBorder: val })} />
						</PanelBody>
					</>}

					{pagination && <>
						<PanelBody className='bPlPanelBody' title={__('Pagination', 'embed-github')} initialOpen={false}>
							<Typography className='mt10' label={__('Typography', 'embed-github')} value={pageBtnTypo} onChange={val => setAttributes({ pageBtnTypo: val })} produce={produce} />

							<ColorsControl className='' label={__('Colors', 'embed-github')} value={pageBtnColors} onChange={val => setAttributes({ pageBtnColors: val })} />

							<ColorsControl className='' label={__('Active Colors', 'embed-github')} value={pageBtnActiveColors} onChange={val => setAttributes({ pageBtnActiveColors: val })} />

							<BorderControl className='mt10' label={__('Border', 'embed-github')} value={pageBtnBorder} onChange={(val) => setAttributes({ pageBtnBorder: val })} />
						</PanelBody>
					</>}

					{!pagination && <>
						<PanelBody className='bPlPanelBody' title={__('Modal Button', 'embed-github')} initialOpen={false}>
							<Typography className='mt20' label={__('Typography', 'embed-github')} value={modalBtnTypo} onChange={val => setAttributes({ modalBtnTypo: val })} produce={produce} />

							<ColorsControl className='' label={__('Colors', 'embed-github')} value={modalBtnColors} onChange={val => setAttributes({ modalBtnColors: val })} />

							<ColorsControl className='' label={__('Hover Colors', 'embed-github')} value={modalBtnHoverColors} onChange={val => setAttributes({ modalBtnHoverColors: val })} />

							<BorderControl className='mt10' label={__('Border', 'embed-github')} value={modalBtnBorder} onChange={(val) => setAttributes({ modalBtnBorder: val })} />

							<BorderControl className='mt10 mb20' label={__('Hover Border', 'embed-github')} value={modalBtnHoverBorder} onChange={(val) => setAttributes({ modalBtnHoverBorder: val })} />

							<BoxControl label={__('Padding', 'embed-github')} values={modalBtnPadding} onChange={val => setAttributes({ modalBtnPadding: val })} resetValues={{ top: 0, right: 0, bottom: 0, left: 0 }} units={[pxUnit(3), emUnit(2)]} />
						</PanelBody>
					</>}

				</>}
			</>}</TabPanel>
		</InspectorControls>
	</>;
};
export default Settings;