

import icons from '../Const/icons';
import Default from './Layout/Default';
import Masonry from './Layout/MasonryArea';

const Modal = ({ attributes, pagination, setIsFullPage, handleFullPage, toggleClass, repos, logo, repoName, desc, download, topic }) => {
    const { columns, githubIcon, layout } = attributes;

    return <>{!pagination && <>
        <div className="modalSection" onClick={(e) => {
            if (e.target.classList.contains('ghbModalMainSection')) {
                setIsFullPage(false);
            }
        }}>
            <button className="button ghbModalBtn button--text-thick button--text-upper button--size-s" data-text="View All Gits" onClick={handleFullPage} ><span>V</span><span>i</span><span>e</span><span>w</span> <span></span><span>A</span><span>l</span><span>l</span><span></span> <span>G</span><span>i</span><span>t</span><span>s</span></button>

            <div className={`ghbModalMainSection ghbModalPopup ${toggleClass}`}>
                <div className="ghbChildSection">
                    <div className="ghbCloseBtn" onClick={() => setIsFullPage(false)}>
                        {icons.closeBtn}
                    </div>
                    <div className={`ghbMainArea ${layout} columns-${columns.desktop} columns-tablet-${columns.tablet} columns-mobile-${columns.mobile}`}>
                        {
                            (() => {
                                switch (layout) {
                                    case 'default':
                                        return <Default currentPosts={repos} logo={logo} githubIcon={githubIcon} repoName={repoName} desc={desc} download={download} topic={topic} />;
                                    case 'masonry':
                                        return <Masonry attributes={attributes} currentPosts={repos} logo={logo} githubIcon={githubIcon} repoName={repoName} desc={desc} download={download} topic={topic} />
                                    default:
                                        return null;
                                }
                            })()
                        }
                    </div>
                </div>
            </div>
        </div>
    </>}</>

}
export default Modal;