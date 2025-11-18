const fs = require("fs");
const path = require("path");
// const timeStamp = require("console");

const sState = require("./../functions/sessionState");

module.exports = function saveFile (evName, data) {
    // Directorio
    // const dir = sState.currentFolder;
    const dir = path.join(sState.currentFolder, evName);
    if (!fs.existsSync(dir)) fs.mkdirSync(dir, {recursive: true});

    // Fichero
    const file = path.join(dir, `${String(sState.index).padStart(6, "0")}.json`);

    // Contenido
    let allData = {
        timestamp: new Date().toISOString(),
        event: evName,
        data
    }

    // Guardado
    fs.writeFileSync(
        file,
        JSON.stringify(
            allData, (_, v) => (typeof v === "bigint" ? v.toString() : v),
            2
        ),
        "utf8"
    );
}
