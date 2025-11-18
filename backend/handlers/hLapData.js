// const fs = require("fs");
const path = require("path");

const sState = require("./../functions/sessionState");
const sFile = require("./../functions/saveFile");

const cJSON = require("./../functions/compareJson");
const sDB = require("./../functions/saveDB");

module.exports = function hLapData (data) {
    const uid = data.m_header.m_sessionUID.toString();
    if (sState.uid !== uid && uid > 0) {
        sState.currentFolder = path.join(__dirname, "..", "event", uid);
        sState.uid = uid;
        sState.index = 0;
    }

    sState.index++;

    if (cJSON("lapDataTimeTrial1_000008", data)) {
        //
        sFile("Plantilla sin procesar - lapData", data);
    } else {
        sFile("lapData", data);
    }
}
