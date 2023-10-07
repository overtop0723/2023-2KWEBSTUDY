const express = require('express');
const port = 3000;
const app = express();

const posts = [];

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    const { query } = req;

    if (Object.keys(query).length > 0) {
        const querys = Object.keys(query).map(k => `${k}: ${query[k]}`).join('\n');
        
        posts.push(querys);

        res.send(posts.join('\n'));

    } else {
        res.send(' ');
    }
})

app.post('/', (req, res) => {
    const { body } = req;

    const body_data = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
        
    posts.push(body_data);

    res.send(posts.join('\n'));
})

app.put('/', (req, res) => {
    const { body } = req;

    const body_data = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
        
    posts.push(body_data);

    res.send(posts.join('\n'));
})

app.delete('/', (req, res) => {
    const { body } = req;

    const body_data = Object.keys(body).map(k => `${k}: ${body[k]}`).join('\n');
        
    posts.push(body_data);

    res.send(posts.join('\n'));
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));