const mongoose = require('mongoose');

const userScheema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    email: {type: String, required: true},
    password: {type: String, required: true},
    username: {type: String, required: true},
    token: {type: String, required: true}
});

module.exports = mongoose.model('User', userScheema)