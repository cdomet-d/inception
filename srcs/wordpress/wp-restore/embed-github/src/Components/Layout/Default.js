import Description from '../Description';
import Download from '../Download';
import Logo from '../Logo';
import RepoName from '../RepoName';
import Topic from '../Topic';

const Default = ({ currentPosts, logo, githubIcon, repoName, desc, download, topic }) => {

    return currentPosts?.map((repositorie, index) => {
        const { name, description, html_url, topics, default_branch } = repositorie;

        return <div key={index} className="ghbSingleRepo">
            <div className='ghbSingleRepoCard'>
                <Logo logo={logo} githubIcon={githubIcon} />
                <RepoName repoName={repoName} name={name} html_url={html_url} />
                <Description description={description} desc={desc} />
                <div className="footer">
                    <Download download={download} html_url={html_url} default_branch={default_branch} />
                    <Topic topic={topic} topics={topics} />
                </div>
            </div>
        </div>;
    })
}
export default Default;