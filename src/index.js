'use strict';
require('./index.html');
var Elm = require('./App.elm');
var mountNode = document.getElementById('main');
var app = Elm.App.embed(mountNode);