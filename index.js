const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
require("dotenv").config();

const app = express();
const port = 3001;

app.use(cors());
app.use(express.json());

// Forbindelse til MySQL
const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME
});

// Kontrollér forbindelsen
connection.connect((error) => {
    if (error) {
        console.error("MySQL fejl:", error.message);
        return;
    }

    console.log("Forbundet til MySQL!");
});
// GET alle trainers
app.get("/api/trainers", (req, res) => {

    connection.query(
        "SELECT * FROM trainer",
        (error, results) => {

            if (error) {
                console.error(error);
                return res.status(500).json({
                    error: "Kunne ikke hente trainers"
                });
            }

            res.json(results);
        }
    );
});

// POST - Opret en ny trainer
app.post("/api/trainers", (req, res) => {
    const { trainer_name, age, hometown } = req.body;

    if (
        typeof trainer_name !== "string" ||
        !trainer_name.trim() ||
        !Number.isInteger(age) ||
        age < 0 ||
        typeof hometown !== "string" ||
        !hometown.trim()
    ) {
        return res.status(400).json({
            error: "Udfyld gyldigt navn, alder og hjemby"
        });
    }

    const sql = `
        INSERT INTO trainer (trainer_name, age, hometown)
        VALUES (?, ?, ?)
    `;

    connection.query(
        sql,
        [trainer_name.trim(), age, hometown.trim()],
        (error, results) => {
            if (error) {
                console.error(error);
                return res.status(500).json({
                    error: "Kunne ikke oprette trainer"
                });
            }

            res.status(201).json({
                message: "Trainer oprettet!",
                trainer_id: results.insertId
            });
        }
    );
});
// POST - Tilføj en Pokémon til en trainer
app.post("/api/trainers/:id/pokemon", (req, res) => {
    const trainerId = Number(req.params.id);
    const pokemonId = req.body.pokedex_number;

    if (
        !Number.isInteger(trainerId) ||
        trainerId <= 0 ||
        !Number.isInteger(pokemonId) ||
        pokemonId <= 0
    ) {
        return res.status(400).json({
            error: "Ugyldigt trainer-ID eller Pokémon-ID"
        });
    }

    const sql = `
        INSERT INTO trainer_pokemon
        (trainer_id, pokedex_number)
        VALUES (?, ?)
    `;

    connection.query(sql, [trainerId, pokemonId], (error) => {
        if (error) {
            if (error.code === "ER_DUP_ENTRY") {
                return res.status(409).json({
                    error: "Traineren har allerede denne Pokémon"
                });
            }

            if (error.code === "ER_NO_REFERENCED_ROW_2") {
                return res.status(404).json({
                    error: "Trainer eller Pokémon findes ikke"
                });
            }

            console.error(error);
            return res.status(500).json({
                error: "Kunne ikke tilføje Pokémon"
            });
        }

        res.status(201).json({
            message: "Pokémon tilføjet!",
            trainer_id: trainerId,
            pokedex_number: pokemonId
        });
    });
});
// GET - Hent en trainers Pokémon
app.get("/api/trainers/:id/pokemon", (req, res) => {

    const trainerId = Number(req.params.id);

    if (!Number.isInteger(trainerId) || trainerId <= 0) {
        return res.status(400).json({
            error: "Ugyldigt trainer-ID"
        });
    }

    const sql = `
        SELECT
            p.pokedex_number,
            p.name,
            p.primary_type,
            p.secondary_type,
            p.hp,
            p.attack,
            p.defence,
            p.special_attack,
            p.special_defence,
            p.speed
        FROM trainer_pokemon tp
        JOIN pokemon p
            ON tp.pokedex_number = p.pokedex_number
        WHERE tp.trainer_id = ?
    `;

    connection.query(sql, [trainerId], (error, results) => {
        if (error) {
            console.error(error);

            return res.status(500).json({
                error: "Kunne ikke hente trainerens Pokémon"
            });
        }

        res.json(results);
    });
});
// Første GET endpoint
app.get("/api/pokemon", (req, res) => {

    const type = req.query.type;
    const minAttack = req.query.minAttack;
    const name = req.query.name;

    let sql = "SELECT * FROM pokemon WHERE 1=1";
    let values = [];

    // Filter 1: Pokémon-type
    if (type) {
        sql += " AND primary_type = ?";
        values.push(type);
    }

    // Filter 2: Minimum attack
    if (minAttack !== undefined) {
        const attack = Number(minAttack);

        if (minAttack.trim() === "" ||
            !Number.isFinite(attack) || attack < 0) {
            return res.status(400).json({
                error: "minAttack skal være et gyldigt tal"
            });
        }

        sql += " AND attack >= ?";
        values.push(attack);
    }

    // Filter 3: Pokémon-navn
    if (name) {
        sql += " AND name LIKE ?";
        values.push("%" + name + "%");
    }

    connection.query(sql, values, (error, results) => {
        if (error) {
            console.error(error);
            return res.status(500).json({
                error: "Kunne ikke hente Pokémon"
            });
        }

        res.json(results);
    });
});

// Start serveren
app.listen(port, () => {
    console.log(`Server kører på http://localhost:${port}`);
});