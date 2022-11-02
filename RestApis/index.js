var express = require('express');
var app = express();

var bodyParser = require('body-parser');
var jsonData = require('./movies.json');

const PORT = 8080;
// app.use(bodyParser.urlencoded({ extended: true })); 
app.use(bodyParser.json());

var router = express.Router();

app.get('/api/movies', (req, res)=> {
    for(i = 0; i < 900000000; i++){}

    res.json(jsonData);

});


app.listen(PORT, () => console.log(`Server runnign on port http://localhost:${PORT}`));