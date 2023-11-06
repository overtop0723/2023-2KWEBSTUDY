const express = require('express');
const { runQuery } = require('./database');
const port = 3000;
const app = express();

app.get('/fare', async (req, res) => {
    try {
        const { uid } = req.query;
        const sql = 'SELECT users.name, Sum(Round(trains.distance/ 10 * types.fare_rate / 100, -2)) AS fare FROM users INNER JOIN tickets ON tickets.user = users.id INNER JOIN trains ON tickets.train = trains.id INNER JOIN types ON trains.type = types.id WHERE users.id = ? ';
        const { name, fare } = (await runQuery(sql, [uid]))[0];
        return res.send(`Total fare of ${name} is ${fare} KRW.`);
    }
    catch (err) {
        console.error(err);
        return res.sendStatus(500);
    }
});

app.get('/train/status', async (req, res) => {
    try {
        const { tid } = req.query;
        const sql = 'SELECT Count(*) AS sold, types.max_seats FROM trains INNER JOIN types ON trains.type = types.id INNER JOIN tickets ON tickets.train = trains.id WHERE trains.id = ? ';
        const { sold, max_seats } = (await runQuery(sql, [tid]))[0];
        if (max_seats == sold) {
            return res.send(`Train ${tid} is sold out`);
        }
        else {
            return res.send(`Train ${tid} is not sold out`);
        }
    }
    catch (err) {
        console.error(err);
        return res.sendStatus(500);
    }
});

app.listen(port, () => console.log(`Server listening on port ${port}!`));