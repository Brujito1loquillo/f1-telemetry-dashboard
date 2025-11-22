// const fs = require("fs");
const path = require("path");

const sState = require("./../functions/sessionState");
const sFile = require("./../functions/saveFile");

const cJSON = require("./../functions/compareJson");
const sDB = require("./../functions/saveDB");

module.exports = async function hParticipants (data) {
    const uid = data.m_header.m_sessionUID.toString();
    if (sState.uid !== uid && uid > 0) {
        sState.currentFolder = path.join(__dirname, "..", "event", uid);
        sState.uid = uid;
        sState.index = 0;
    }

    sState.index++;

    if (cJSON("participantsSigleplayerGrandPrix1_000009", data)) {
        const playerCarIndex = data.m_header.m_playerCarIndex;

        for (i = 0; i < data.m_participants.length; i++) {
            const participant = data.m_participants[i];
            const pilotos = await sDB("select * from piloto where nombre = ?", [participant.m_name]);
            if (pilotos.length === 0) {
                try {
                    await sDB("insert into piloto values (?, ?, ?, ?, ?)", [participant.m_name, participant.m_raceNumber, participant.m_nationality, participant.m_techLevel, participant.m_platform]);
                } catch (errPiloto) {
                    if (errPiloto.code !== "ER_DUP_ENTRY") {
                        console.error("Error en la insercion de piloto y no es por duplicidad.");
                        throw errPiloto;
                    }
                }
            }

            const participantes = await sDB("select * from sesionParticipaPiloto where sesionUid = ? and pilotoNombre = ?", [uid, participant.m_name]);
            if (participantes.length === 0) {
                try {
                    await sDB("insert into sesionParticipaPiloto values (?, ?, ?, ?, ?, ?, ?, ?)", [uid, participant.m_name, participant.m_teamId, i, participant.m_aiControlled, participant.m_yourTelemetry, participant.m_myTeam, participant.m_techLevel])
                    // Comprovar IA:
                        // JSON : 1 = true
                        // DB : 1 = ?
                    // COMPROVAR MyTELEMETRI
                        // JSON : 1 = false
                        // DB : 1 = ?
                    // COMPROVAR MyTELEMETRI
                        // JSON : 0 = false
                        // DB : 0 = ?
                    // OJO lvlTecnico
                } catch (errParticipante) {
                    if (errParticipante.code !== "ER_DUP_ENTRY") {
                        console.error("Error en la insercion de participante y no es por duplicidad.");
                        throw errParticipante;
                    }
                }
            }
        }

        sFile("DB - participants");
    } else {
        sFile("participants", data);
    }
}
