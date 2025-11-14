const db = require("mysql2/promise");

const pool = db.createPool({
    host: "localhost",
    user: "root",
    password: "",
    database: "f1telemetria",
    waitForConnections: true,
    connectionLimit: 10
});

module.exports = async function saveDB (query, params) {
    const [rows] = await pool.execute(query, params);
    return rows;
}
