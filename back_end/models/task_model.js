const mongoose = require('mongoose')
const Joi = require('joi')
const Schema = mongoose.Schema

const TaskSchema = new Schema({
    title: {
        type: String,
        required: true,
        unique: true,
        trim: true
    },
    content: {
        type: String,
        trim: true,
    },
    status: {
        type: String,
        trim: true,
    },
    processDate: {
        type: Date,
        default: Date.now
    },
}, {collection : "task", versionKey : false})

const schema = Joi.object({
    title : Joi.string().trim().required(),
    content : Joi.string().trim(),
    status : Joi.string().trim()
})

TaskSchema.methods.joiValidation = function(taskObject) {
    schema.required()
    return schema.validate(taskObject)
}


const Task = mongoose.model('Task', TaskSchema);
module.exports = Task;

