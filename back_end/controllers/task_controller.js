const Task = require('../models/task_model')
const messages = require('../constants/response_message')
const Environment = require('../models/environment_model')

const fetchAllTasks = async (req, res) => {
    try {
        const allTasks = await Task.find({})
        return res.status(200).json({
            code: 200,
            isOk: true,
            data: allTasks.reverse(),
            error: null
        })
    } catch (err) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

const createTask = async (req, res) => {
    try {
        const willBeAddedTask = new Task(req.body)
        const { error }= willBeAddedTask.joiValidation(req.body)

        if(error) {
            return res.status(400).json({
                code: 400,
                isOk : false,
                data: null,
                error : error
            })
        }

        await willBeAddedTask.save()
        const addedTask = await Task.findOne({title : req.body.title})
        return res.status(201).json({
            code: 201,
            isOk : true,
            data: addedTask,
            error: null
        })
    } catch (err) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

const updateTaskById = async (req,res) => {
    try {

        delete req.body._id
        const willBeUpdatedTask = await Task.findByIdAndUpdate({_id : req.params.id}, req.body, {new : true, lean: true})
        if(willBeUpdatedTask) {
            return res.status(201).json(willBeUpdatedTask)
        } else {
            return res.status(400).json({
                code: 400,
                isOk : false,
                data: null,
                error : messages.ERROR.general_error_message
            })
        }
        
    } catch (err) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

const deleteTaskById = async (req, res) => {
    try {
        const willBeDeletedTask = await Task.findByIdAndDelete({_id : req.params.id})
        if(willBeDeletedTask) {
            return res.status(201).json({
                code: 201,
                isOk : true,
                data: null,
                error: null
            })
        } else {
            return res.status(400).json({
                code: 400,
                isOk : false,
                data: null,
                error: messages.ERROR.general_error_message
            })
        }
    } catch (err) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

const buildPlatformEnvironment = async (req,res) => {
    try {
        const environment = new Environment(req.body)
        await environment.save()

        return res.status(201).json({
            code: 201,
            isOk : true,
            data: environment,
            error: null
        })
    } catch (error) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

const fetchPlatformEnvironment = async (req, res) => {
    try {
        const platformEnvironment = await Environment.find({})
        return res.status(201).json({
            code: 201,
            isOk : true,
            data: platformEnvironment,
            error: null
        })
    } catch (error) {
        return res.status(500).json({
            code: 500,
            isOk: false,
            data: null,
            error: err,
        })
    }
}

module.exports = {
    fetchAllTasks,
    createTask,
    updateTaskById,
    deleteTaskById,
    buildPlatformEnvironment,
    fetchPlatformEnvironment
}