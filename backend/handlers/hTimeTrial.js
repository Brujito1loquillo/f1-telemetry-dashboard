// const fs = require("fs");
const path = require("path");

const sState = require("./../functions/sessionState");
const sFile = require("./../functions/saveFile");

const cJSON = require("./../functions/compareJson");
const sDB = require("./../functions/saveDB");

module.exports = async function hTimeTrial (data) {
    const uid = data.m_header.m_sessionUID.toString();
    if (sState.uid !== uid && uid > 0) {
        sState.currentFolder = path.join(__dirname, "..", "event", uid);
        sState.uid = uid;
        sState.index = 0;
    }

    sState.index++;

    if (cJSON("timeTrialTimeTrial1_000007", data)) {
        const sBest = data.m_playerSessionBestDataSet;
        const pBest = data.m_personalBestDataSet;
        const rBest = data.m_rivalDataSet;

        if (sBest.m_lapTimeInMS !== 0) {
            console.warn("Ya hay un mejor tiempo de la session");
        } else {
            console.log("Aun no hay mejor tiempo de session");
        }

        /* ******* *
         * EQUIPOS *
         * ******* */
        const sCar = (sBest.m_equalCarPerformance === 0) ? sBest.m_teamId : 1000;
        const equipos = await sDB("select id from equipo where id = ?", [sCar]);
        if (equipos.length === 0) {
            try {
                await sDB("insert into equipo (id) values (?)", [sCar]);
            } catch (errEquipos) {
                if (errEquipos.code !== "ER_DUP_ENTRY") {
                    console.error("Error en la insercion de circuito y no es por duplicidad.");
                    throw errEquipos;
                }
            }
        }

        const pCar = (pBest.m_equalCarPerformance === 0) ? pBest.m_teamId : 1000;
        const equipos2 = await sDB("select id from equipo where id = ?", [pCar]);
        if (equipos2.length === 0) {
            try {
                await sDB("insert into equipo (id) values (?)", [pCar]);
            } catch (errEquipos2) {
                if (errEquipos2.code !== "ER_DUP_ENTRY") {
                    console.error("Error en la insercion de circuito y no es por duplicidad.");
                    throw errEquipos2;
                }
            }
        }
        
        const rCar = (rBest.m_equalCarPerformance === 0) ? rBest.m_teamId : 1000;
        if (rBest.m_lapTimeInMS !== 0) {
            const equipos3 = await sDB("select id from equipo where id = ?", [rCar]);
            if (equipos3.length === 0) {
                try {
                    await sDB("insert into equipo (id) values (?)", [rCar]);
                } catch (errEquipos3) {
                    if (errEquipos3.code !== "ER_DUP_ENTRY") {
                        console.error("Error en la insercion de circuito y no es por duplicidad.");
                        throw errEquipos3;
                    }
                }
            }    
        } else {
            // No hay rival
        }

        /* ************* *
         * PARTICIPANTES *
         * ************* */
        // uid
        // sBest
        // pBest
        // rBest
        // Se necesita tener almacenado al pilto y de momento no se puede
        // const participantes = await sDB("select * from sesionParticipaPiloto where sesionUid = ? and indiceArray = ?")
        sFile("dependenciaParticipantes - timeTrial", data);
    } else {
        sFile("timeTrial", data);
    }
}
