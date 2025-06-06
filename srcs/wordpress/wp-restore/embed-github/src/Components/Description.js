
const Description = ({ desc, description }) => {
    return desc && <>
        {description ? <p className='desc'>{description}</p>
            : <p className='desc'>Null</p>}
    </>
}
export default Description;