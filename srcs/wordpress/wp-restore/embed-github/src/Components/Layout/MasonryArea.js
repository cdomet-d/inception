
import Masonry, { ResponsiveMasonry } from "react-responsive-masonry";
import Description from '../Description';
import Download from '../Download';
import Logo from '../Logo';
import RepoName from '../RepoName';
import Topic from '../Topic';

const MasonryArea = ({ currentPosts, logo, githubIcon, repoName, desc, download, topic, attributes }) => {
    const { columnGap, rowGap, columns } = attributes;
    const { desktop, tablet, mobile } = columns;
    return <ResponsiveMasonry columnsCountBreakPoints={{ 0: mobile, 576: tablet, 768: desktop }}>
        <Masonry columnsCount={3} gutter={`${rowGap} ${columnGap}`}>
            {currentPosts?.map((repositorie, index) => {
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
            })}
        </Masonry>
    </ResponsiveMasonry>

}
export default MasonryArea;