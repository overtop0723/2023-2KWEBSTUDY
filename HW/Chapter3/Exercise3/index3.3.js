const express = require('express');
const port = 3000;
const app = express();

app.get('/factorial', (req, res) => {
    const number = req.query.number;
    res.redirect(`/factorial/${number}`); 
})

app.get('/factorial/:factorial', (req, res) => {
    const factorial = parseInt(req.params.factorial);

    var factorialValue = 1;
    for(let i = 1; i <= factorial ; i++) {
        factorialValue = factorialValue * i;
    }
    res.send(`${factorialValue.toString()}`);
})

app.listen(port, () => console.log(`Server listening on port ${port}!`));
