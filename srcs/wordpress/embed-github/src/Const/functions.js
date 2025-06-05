export const getBoxValue = object => Object.values(object).join(" ");

export const getNumber = (val) => {
    const colGap = val;
    const columnGap = colGap.match(/\d/g);
    const gutterX = parseInt(columnGap.join(""));
    return gutterX;

}

export const tabController = () => {
    setTimeout(() => {
        const panelBodies = document.querySelectorAll('.components-panel__body-title button');
        panelBodies.forEach(item => {
            item.addEventListener('click', clickEveryItem);
        });

        function clickEveryItem() {
            this.removeEventListener('click', clickEveryItem);
            panelBodies.forEach(item => {
                if (item.getAttribute('aria-expanded') === 'true' && !item.isEqualNode(this)) {
                    item.click();
                }
            });
            setTimeout(() => {
                this.addEventListener('click', clickEveryItem);
            }, 500);
        }
    }, 500);
};

