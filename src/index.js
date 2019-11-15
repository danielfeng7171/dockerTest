const path = require('path');

const p = path.join(__dirname, '../.env');
require('dotenv').config({path: p});

console.log(process.env.DOCKER_VARIABLE);
console.log(process.env.SECRET_KEY);