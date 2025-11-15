const fs = require("fs");
const path = require("path");

const sState = require("./sessionState");

function compareEstructure (obj1, obj2) {
    if (typeof obj1 !== typeof obj2)  return false;

    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);

    if (keys1.length !== keys2.length) return false;
    
    for (let key of keys1) {
        if (!keys2.includes(key)) return false;
        if (typeof obj1[key] === "object" && !compareEstructure(obj1[key], obj2[key])) return false;
    }

    return true;
}

module.exports = function compareJson (file, obj2) {
    const obj1 = JSON.parse(fs.readFileSync(`./archive/${file}.json`, "utf8")).data;
    return compareEstructure(obj1, obj2);
}
