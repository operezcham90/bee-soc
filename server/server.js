var cp = require('child_process');

var express = require('express');
var multer = require('multer');

var upload = multer({ dest: '/root/uploads/' });
var app = express();

var file = null;
var rows = null;
var cols = null;
var working = false;
var init = Date.now();
var time = null;

app.get('/', function (req, res) {
    res.sendFile('/root/index.html');
});

app.post('/data', upload.single('data'), function (req, res) {
    file = req.file;
    rows = req.body.rows;
    cols = req.body.cols;
    working = true;
    init = Date.now();
    cp.exec('node devmem.js ' + file.path + ' ' + cols + ' ' + rows, rest);
    res.sendStatus(200);
});

app.get('/data', function (req, res) {
    if (working) {
        res.sendStatus(404);
    } else {
        res.sendFile(file.path);
    }
});

app.get('/stat', function (req, res) {
    res.json({
        time: time
    });
});

app.listen(80, function () {
    console.log('Running');
});

function rest(error, stdout, stderr) {
    console.log('working...');
    if (error) {
        console.error(error);
    } if (stderr) {
        console.error(error);
    }
    console.log(stdout);
    time = Date.now() - init;
    working = false;
}