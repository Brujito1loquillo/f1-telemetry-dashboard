// const fs = require("fs");
const path = require("path");

const sState = require("./../functions/sessionState");
const sFile = require("./../functions/saveFile");

const cJSON = require("./../functions/compareJson");
const sDB = require("./../functions/saveDB");

module.exports = async function hSession (data) {
    const uid = data.m_header.m_sessionUID.toString();
    if (sState.uid !== uid && uid > 0) {
        sState.currentFolder = path.join(__dirname, "..", "event", uid);
        sState.uid = uid;
        sState.index = 0;
    }

    sState.index++;

    if (cJSON("sessionExivition1_000007", data)) {
        const sesiones = await sDB("select * from sesion where uid = ?", [data.m_header.m_sessionUID]);
        if (sesiones.length === 0) {
            const circuitos = await sDB("select * from circuito where id = ?", [data.m_trackId]);
            if (circuitos.length === 0) {
                await sDB("insert into circuito (id, longitud, velocidadPitLine) values (?, ?, ?)", [data.m_trackId, data.m_trackLength, data.m_pitSpeedLimit]);
            }

            await sDB("insert into sesion (uid, tipo, circuitoId, cocheJugadorId) values (?, ?, ?, ?)", [data.m_header.m_sessionUID, data.m_sessionType, data.m_trackId, data.m_header.m_playerCarIndex]);
        }

        sFile("DB - session", data);
    } else {
        sFile("session", data);
    }
    
}
