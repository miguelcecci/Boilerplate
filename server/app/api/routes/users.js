const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const hash = require('object-hash');

const User = require('../models/user');

router.get('/', (req, res, next) => {
    res.status(200).json({
        message: 'users recuperados'
    });
});

router.post('/register', (req, res, next) => {
    const user = new User({
        _id: new mongoose.Types.ObjectId(),
        email: req.body.email,
        password: hash(req.body.password),
        username: req.body.username,
        token: Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15)
    });
    user.save().then(result => {
        console.log(result);
    }).catch(
        err => console.log(err)
    );
    res.status(201).json({
        message: 'user created',
        createdUser: user
    });
});

router.post('/login', (req, res, next) => {
    const email = req.body.email;
    const password = req.body.password;
    User.findOne(email)
    .exec()
    .then(doc => {
        console.log(doc);
        res.status(200).json(doc);
    })
    .catch(err => {
        console.log(err);
        res.status(500).json({error: err})
    });

});

module.exports = router;