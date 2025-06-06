

const getTimeFromString = (string) => {
    if (!isNaN(string)) {
        return parseInt(string);
    }

    if (string.includes('px')) {
        return parseInt(string.match(/\d+/)?.[0]) * 60;
    }
    if (string.includes('em')) {
        return parseInt(string.match(/\d+/)?.[0]) * 60 * 60;
    }

}

export default getTimeFromString