

import { useEffect, useRef, useState } from 'react';
import Pagination from './Components/Pagination';

import Modal from './Components/Modal';
import Default from './Components/Layout/Default';
import Masonry from './Components/Layout/MasonryArea';

const Repositories = ({ attributes, repos, clientId }) => {
	const { elements, query, columns, githubIcon, layout } = attributes;
	const { logo, repoName, desc, download, topic, pagination, masonry } = elements;
	const [isFullPage, setIsFullPage] = useState(false);
	// Pagination 
	const { postsPerPage } = query;
	const [currentPage, setCurrentPage] = useState(1);
	const [currentPosts, setCurrentPosts] = useState([]);
	const containerRef = useRef();

	// Handle full page 
	const handleFullPage = () => {
		setIsFullPage(true);
	}

	let toggleClass = isFullPage ? 'activeFull' : null;

	useEffect(() => {
		const lastPostsIndex = currentPage * postsPerPage;
		const firstPostsIndex = lastPostsIndex - postsPerPage;
		const currentPosts = repos?.slice(firstPostsIndex, lastPostsIndex);
		setCurrentPosts(currentPosts);

	}, [currentPage, repos, postsPerPage]);

	return <div className='ghbSectionArea'>
		<><div ref={containerRef} className={`ghbMainArea ${layout} columns-${columns.desktop} columns-tablet-${columns.tablet} columns-mobile-${columns.mobile} `}>

			{(() => {
				switch (layout) {
					case 'default':
						return <Default currentPosts={currentPosts} logo={logo} githubIcon={githubIcon} repoName={repoName} desc={desc} download={download} topic={topic} />;
					case 'masonry':
						return <Masonry attributes={attributes} currentPosts={currentPosts} logo={logo} githubIcon={githubIcon} repoName={repoName} desc={desc} download={download} topic={topic} />
					default:
						return null;
				}
			})()}

		</div>

			{pagination && <>
				<Pagination totalPosts={repos.length} postPerPage={postsPerPage} setCurrentPage={setCurrentPage} currentPage={currentPage} />
			</>}

			<Modal currentPosts={currentPosts} clientId={clientId} attributes={attributes} pagination={pagination} setIsFullPage={setIsFullPage} handleFullPage={handleFullPage} toggleClass={toggleClass} repos={repos} logo={logo} repoName={repoName} desc={desc} download={download} topic={topic} masonry={masonry} />
		</>
	</div>
}
export default Repositories;