
const Topic = ({ topic, topics }) => {
    return <> {topic && <>

        {topics?.[0] ? <p className='topic'>{topics?.[0]}</p>
            : <p className='topic'>Null</p>}
    </>}</>
}
export default Topic;