import path from 'path';

const p = path.join(__dirname, '../../../env/.env.dev');
require('dotenv').config({path: p});

console.log(process.env.JWT_SECRET);
console.log(process.env.SESSION_SECRET);