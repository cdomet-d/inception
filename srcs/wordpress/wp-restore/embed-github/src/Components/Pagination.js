import icons from '../Const/icons';

const Pagination = ({ totalPosts, postPerPage, setCurrentPage, currentPage }) => {

    let pages = [];
    for (let i = 1; i <= Math.ceil(totalPosts / postPerPage); i++) {
        pages.push(i);
    }

    return (
        <div className='pagination'>
            {currentPage > 1 && <button onClick={() => setCurrentPage(currentPage - 1)}>{icons.left}</button>}
            {
                pages.map((page, index) => {
                    return <> <button key={index} onClick={() => setCurrentPage(page)} className={` ${page === currentPage ? 'active' : ''}`}>{page}</button></>
                })
            }
            {currentPage < pages.length && <button onClick={() => setCurrentPage(currentPage + 1)}>{icons.right}</button>}

        </div>
    )
}
export default Pagination;
