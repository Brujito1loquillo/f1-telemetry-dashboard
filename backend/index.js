// F1 Telemetry
const { F1TelemetryClient, constants } = require("@z0mt3c/f1-telemetry-client");
const { PACKETS } = constants;

// Handlers
const {
    hEvent,
    hMotion,
    hCarSetups,
    hLapData,
    hSession,
    hParticipants,
    hCarTelemetry,
    hCarStatus,
    hFinalClassification,
    hLobbyInfo,
    hCarDamage,
    hSessionHistory,
    hTyreSets,
    hMotionEx,
    hTimeTrial
} = require ("./handlers/handlers");

// Session State
const sState = require("./functions/sessionState");
// Comprobar directorios por defecto
const fs = require("fs");
if (!fs.existsSync(sState.currentFolder))
    fs.mkdirSync(sState.currentFolder, {recursive: true});

// Cliente
const client = new F1TelemetryClient({
    port: 20777,
    forwardAddresses: [{
        port: 20777,
        ip: "192.168.1.61"
    }]
});

client.start();

// Asignacion de manejadores
client.on(PACKETS.event, hEvent);
client.on(PACKETS.motion, hMotion);
client.on(PACKETS.carSetups, hCarSetups);
client.on(PACKETS.lapData, hLapData);
client.on(PACKETS.session, hSession);
client.on(PACKETS.participants, hParticipants);
client.on(PACKETS.carTelemetry, hCarTelemetry);
client.on(PACKETS.carStatus, hCarStatus);
client.on(PACKETS.finalClassification, hFinalClassification);
client.on(PACKETS.lobbyInfo, hLobbyInfo);
client.on(PACKETS.carDamage, hCarDamage);
client.on(PACKETS.sessionHistory, hSessionHistory);
client.on(PACKETS.tyreSets, hTyreSets);
client.on(PACKETS.motionEx, hMotionEx);
client.on(PACKETS.timeTrial, hTimeTrial);
