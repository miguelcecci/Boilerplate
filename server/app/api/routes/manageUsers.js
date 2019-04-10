const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const hash = require('object-hash');

const Admin = require('../models/admin');
const User = require('../models/user');


//verify admin token middleware
router.use((req, res, next) => {
    const token = req.headers['x-access-token'];
    Admin.findOne({ 'token':token })
    .exec()
    .then(doc => {
        if(!!doc){
            next();
        }else{
            console.log(doc);
            res.status(200).json({
                message: "Invalid token.AAA "
            });
        }
    })
    .catch(err => {
        console.log(err);
        res.status(500).json({error: err})
    });
});

//list all users
router.get('/', (req, res, next) => {
    User.find({}).exec().then(doc => {
        res.status(200).json(doc);
    });
});

module.exports = router;