const mongoose = require('mongoose')
const Schema = mongoose.Schema

const EnvironmentSchema = new Schema({
    type: {
        type: String
    }
}, {collection : "environment", versionKey : false})


const Environment  = mongoose.model('Environment', EnvironmentSchema);
module.exports = Environment;

