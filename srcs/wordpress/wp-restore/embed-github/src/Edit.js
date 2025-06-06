
import { __ } from '@wordpress/i18n';
import { useState, useEffect } from 'react';

import Settings from './Settings';
import Style from './Style';
import Repositories from './Repositories';
import { tabController } from './Const/functions';
import icons from './Const/icons';
import axios from 'axios';

import BPLSDK from '../bplugins_sdk/src/components/v1/BPLSDK';

const Edit = props => {
	const { className, attributes, setAttributes, clientId, isSelected } = props;

	const { userName } = attributes;

	const [repos, setRepos] = useState([]);
	const [loading, setLoading] = useState(true);
	useEffect(() => { clientId && setAttributes({ cId: clientId.substring(0, 10) }); }, [clientId]); // Set & Update clientId to cId

	useEffect(() => tabController(), [isSelected]);

	const handleFetchData = async () => {
		setLoading(true);
		try {
			const response = await axios.get(
				`https://api.github.com/users/${userName}/repos?per_page=100`
			);
			setRepos(response.data);

		} catch (error) {
			console.error(error.message);
		}
		setLoading(false);
	}

	useEffect(() => {
		handleFetchData();
	}, [])

	return <>
		<Settings handleFetchData={handleFetchData} repos={repos} setRepos={setRepos} attributes={attributes} setAttributes={setAttributes} clientId={clientId} loading={loading} setLoading={setLoading} />

		<BPLSDK setAttributes={setAttributes} />

		<div className={className} id={`ghbMainArea-${clientId}`}>
			<Style attributes={attributes} clientId={clientId} />

			{loading ? <div className="loader ghbUserName">
				{icons.preloader}
			</div> : <>
				{repos.length ?
					<Repositories clientId={clientId} attributes={attributes} repos={repos} setRepos={setRepos} loading={loading} setLoading={setLoading} />
					: <div className='ghbUserName'>
						<h1>{__('Please Insert Your Github Username And Fetch Data', 'embed-github')}</h1>
					</div>}
			</>}
		</div >
	</>;
};
export default Edit;