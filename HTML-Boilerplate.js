"use strict";

var fs = require("fs");

var args = process.argv.slice(2)[0];

var defcss = "\n/* * * * * * * * * * * * * * * */\n/* Copyright (c) 2017 NullDev. */\n/* * * * * * * * * * * * * * * */\n\n" +
			 "/* * * * */\n/* RESET */\n/* * * * */\n\nbody { \n    -webkit-text-size-adjust:     none;\n    -ms-text-size-adjust:" +
			 "         none;\n    -ms-overflow-style:           scrollbar;\n}\n\n*, :before, :after {\n    -moz-box-sizing:              border-box;\n" +
			 "    -webkit-box-sizing:           border-box;\n    box-sizing:                   border-box;\n}\n\n" +
			 "/* * * * * * * * */\n/* RESPONSIVENES */\n/* * * * * * * * */\n\n/* --- DESKTOP --- */\n@media (min-width: 1161px) {\n\n}\n\n" +
			 "/* --- TABLET --- */\n@media (min-width: 768px) and (max-width: 1160px){\n\n}\n\n/* --- PHONE --- */\n@media (max-width: 767px) {\n\n}\n";

var defjs = "\n\"use strict\";\n\n/* * * * * * * * * * * * * * * */\n/* Copyright (c) 2017 NullDev. */\n/* * * * * * * * * * * * * * * */\n\n" +
			"$(document).ready(function() {\n\n}\n";

var defhtml = "<!DOCTYPE html>\n<html>\n    <head>\n        <meta charset=\"UTF-8\">\n        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n" +
			  "        <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/main.css\">\n        <title>Static Page</title>\n        <link rel=\"icon\" " +
			  "href=\"https://nulldev.org/img/nl.png\">\n        <script src=\"https://code.jquery.com/jquery-3.2.1.min.js\"></script>\n" +
			  "        <script type=\"text/javascript\" src=\"./js/main.js\"></script>\n    </head>\n    <body>\n\n    </body>\n</html>\n";

function prompt(question, callback) {
    var stdin  = process.stdin,
        stdout = process.stdout;

    stdin.resume();
    stdout.write(question);

    stdin.once('data', function (data) { callback(data.toString().trim()); });
}

function main() { args ? createHtml(args) : promtInput(); }

function createHtml(name){
	var dir = "./" + name,
		css = dir + "/css",
		jsf = dir + "/js",
		img = dir + "/img";

	var ext = [dir, css, jsf, img];

	for (var i in ext) if (!fs.existsSync(ext[i])) fs.mkdirSync(ext[i]);

	fs.writeFile((css + "/main.css"),   defcss,  function(err) { if (err) return console.log(err); });
	fs.writeFile((jsf + "/main.js"),    defjs,   function(err) { if (err) return console.log(err); });
	fs.writeFile((dir + "/index.html"), defhtml, function(err) { if (err) return console.log(err); });

	console.log("\nAll done!\nProject " + name + " has been created.\n");
}

function promtInput(){ prompt("\nName of the project: ", function (input) { createHtml(input); }); }

main();
