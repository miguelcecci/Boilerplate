// const dbAddress = 'mongodb://'+process.env.DB.ADRESS+':'+process.env.DB.PORT+'/'+process.env.DB.NAME
const dbAddress = 'mongodb://127.0.0.1:27017/test'
console.log(">Conecting to database "+dbAddress);
const accessOrigin = '*'
const accessHeaders = '*'

const express = require('express');
const app = express();
const morgan = require('morgan');
const mongoose = require('mongoose');
const bodyParser = require('body-parser'); //tirar isso aqui, ja vem no express

const userRoutes = require('./api/routes/users');
const adminRoutes = require('./api/routes/admins');
const manageUsersRoutes = require('./api/routes/manageUsers');

mongoose.connect(dbAddress, {useNewUrlParser: true}).then(() => {
    console.log("Connected to Database");
    }).catch((err) => {
        console.log("Database ERROR! ", err);
});

const db = mongoose.connection;

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use((req, res, next) => {
    res.header('Acces-Control-Allow-Origin', process.env.ACCESS_ORIGIN);
    res.header('Acces-Control-Allow-Headers', process.env.ACCESS_HEADERS);
    if(req.method === 'OPTIONS'){
        res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE');
        return res.status(200).json({});
    }
    next();
});

app.use('/users', userRoutes);
app.use('/admin', adminRoutes);
app.use('/manageUsers', manageUsersRoutes);

app.use((req, res, next) => {
    const error = new Error('Not found');
    error.status = 404;
    next(error);
});

app.use((error, req, res, next) => {
    res.status(error.status || 500);
    res.json({
        error: {
            message: error.message
        }
    });
});

module.exports = app;