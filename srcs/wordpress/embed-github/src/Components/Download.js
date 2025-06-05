

const Download = ({ download, html_url, default_branch, }) => {
    return download && <a className='download' href={`${html_url}/archive/${default_branch}.zip`} target="_blank" rel="noopener noreferrer">Download</a>
}
export default Download;