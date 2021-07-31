const taskRouter = require('express').Router()
const taskController = require('../controllers/task_controller')

taskRouter.get('/fetchAllTasks', taskController.fetchAllTasks)
taskRouter.post('/createTask', taskController.createTask)
taskRouter.post('/updateTaskById/:id', taskController.updateTaskById)
taskRouter.post('/deleteTaskById/:id', taskController.deleteTaskById)
taskRouter.post('/buildPlatformEnvironment', taskController.buildPlatformEnvironment)
taskRouter.get('/fetchPlatformEnvironment', taskController.fetchPlatformEnvironment)

module.exports = taskRouter