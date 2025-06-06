

import icons from '../Const/icons';
const Logo = ({ logo, githubIcon }) => {
    return logo && icons.github2(githubIcon.size, githubIcon.color)
}
export default Logo;