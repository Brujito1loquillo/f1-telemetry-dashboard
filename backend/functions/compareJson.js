const fs = require("fs");
const path = require("path");

const sState = require("./sessionState");

function compareEstructure (obj1, obj2) {
    const log = path.join(__dirname, "log", "compareJson.log");
    fs.appendFileSync(log, `Comparamos nuevos datos de ${sState.index}\n`, "utf8");

    // const array1 = Array.isArray(obj1);
    // const array2 = Array.isArray(obj2);
    if (typeof obj1 !== typeof obj2) {
        // fs.appendFileSync(log, `Es array1: ${array1} y array2: ${array2}\n`, "utf8");
        fs.appendFileSync(log, `Obj1 es : ${typeof obj1} y obj2: ${typeof obj2}\n`, "utf8");
        return false;
    }

    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);

    if (keys1.length !== keys2.length) {
        fs.appendFileSync(log, `Longitud de objetos distinta 1: ${keys1.length} y 2: ${keys2.length}\n`);
        return false;
    }

    for (let key of keys1) {
        if (!keys2.includes(key)) {
            fs.appendFileSync(log, `La clave: ${key} no esta en ambos objetos\n`);
            return false;
        }

        if (typeof obj1[key] === "object" && !compareEstructure(obj1[key], obj2[key])) {
            fs.appendFileSync(log, `Los hijos de obj1[${key}] no son iguales a los de obj2[${key}]\n`, "utf8");
            return false;
        }
    }

    return true;
}

module.exports = function compareJson (file, obj2) {
    const obj1 = JSON.parse(fs.readFileSync(`./archive/${file}.json`, "utf8")).data;
    return compareEstructure(obj1, obj2);
}
