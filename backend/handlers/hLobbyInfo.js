// const fs = require("fs");
const path = require("path");

const sState = require("./../functions/sessionState");
const sFile = require("./../functions/saveFile");

module.exports = function hLobbyInfo (data) {
    const uid = data.m_header.m_sessionUID.toString();
    if (sState.uid !== uid && uid > 0) {
        sState.currentFolder = path.join(__dirname, "..", "event", uid);
        sState.uid = uid;
        sState.index = 0;
    }

    sState.index++;
    sFile("lobbyInfo", data);
}
