var express = require("express");
var http = require("http");
var html = express();

html.use(express.static(__dirname));
html.use(express.bodyParser());

server = http.createServer(html);
server.listen(80, '0.0.0.0');

console.log("Listening on port " + 80 + " serving " + __dirname);