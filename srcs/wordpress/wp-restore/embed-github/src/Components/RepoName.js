const RepoName = ({ repoName, name, html_url }) => {
    return repoName && <a className='name' data-hover={name} href={html_url} target="_blank" rel="noopener noreferrer">{name}</a>
}
export default RepoName;