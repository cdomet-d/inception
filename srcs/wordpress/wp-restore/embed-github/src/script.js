import { createRoot } from 'react-dom/client';
import { useState, useEffect } from 'react';
import axios from "axios";

import './style.scss';
import Style from './Style';
import Repositories from './Repositories';
import icons from './Const/icons';

// Github Block
document.addEventListener('DOMContentLoaded', () => {
	const allBlockDirectory = document.querySelectorAll('.wp-block-ghb-github');
	allBlockDirectory.forEach(directory => {
		const attributes = JSON.parse(directory.dataset.attributes);

		createRoot(directory).render(<>
			<Style attributes={attributes} clientId={attributes.cId} />
			<RenderRepositories attributes={attributes} />
		</>);

		directory?.removeAttribute('data-attributes');
	});
});

const RenderRepositories = ({ attributes }) => {
	const { userName } = attributes;
	const [repos, setRepos] = useState([]);
	const [loading, setLoading] = useState(false);
	// Fetch Data 
	useEffect(() => {
		const fetchData = async () => {
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
		fetchData();
	}, []);

	return loading ? <div className="loader ghbUserName">
		{icons.preloader}
	</div> : <>
		{repos.length ?
			<Repositories attributes={attributes} repos={repos} setRepos={setRepos} loading={loading} setLoading={setLoading} />
			: <span></span>}
	</>
}
