var fs = require('fs');

var mmap = require('mmap-io');

var result = 10;
var start = 8;
var done = 9;
var offset = [
    0x41200000,
    0x41210000,
    0x41220000,
    0x41230000,
    0x41240000,
    0x41250000,
    0x41260000,
    0x41270000,
    0x41280000,
    0x41290000,
    0x412A0000
];
var mem = [];
fs.open('/dev/mem', 'r+', function (status, fd) {
    if (status) {
        console.log(status.message);
        return;
    }
    console.log('devmem open');
    mapping(fd);
});
function mapping(fd) {
    var page_base = [];
    var page_offset = [];
    for (var i = 0; i < offset.length; i++) {
        page_base.push(Math.floor(offset[i] / mmap.PAGESIZE) * mmap.PAGESIZE);
        page_offset.push(offset[i] - page_base[i]);
        mem.push(mmap.map(page_offset[i] + 1, mmap.PROT_WRITE, mmap.MAP_SHARED, fd, page_base[i]));
        mmap.advise(mem[i], mmap.MADV_RANDOM);
    }
    console.log('map ready');
    writing();
}
function writing() {
    var path = process.argv[2];
    var cols = parseInt(process.argv[3]);
    var rows = parseInt(process.argv[4]);

    var mat = new Uint8Array(fs.readFileSync(path, null));
    var res = new Uint8Array((cols - 2) * (rows - 2));

    var rows2 = rows - 2;
    var cols2 = cols - 2;

    var stepj = 0;
    var stepj2 = 0;

    for (var j = 0; j < rows2; j++) {
        for (var i = 0; i < cols2; i++) {
            res[i + stepj] = mat[i + stepj2];

            mem[0][0] = mat[i + stepj2];
            mem[1][0] = mat[i + stepj2 + 1];
            mem[2][0] = mat[i + stepj2 + 2];

            mem[3][0] = mat[i + stepj2 + cols];
            mem[4][0] = mat[i + stepj2 + cols + 2];

            mem[5][0] = mat[i + stepj2 + cols * 2];
            mem[6][0] = mat[i + stepj2 + cols * 2 + 1];
            mem[7][0] = mat[i + stepj2 + cols * 2 + 2];

            res[i + stepj] = mem[result][0];
        }
        stepj += cols2;
        stepj2 += cols;
    }
    fs.writeFileSync(path, res);
    console.log('sobel done');
}