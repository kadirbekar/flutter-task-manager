const express = require('express')
const app = express()

app.use(express.json())
require('./database/mongoose')

const taskRouter = require('./routers/task_router')

app.use('/api/task', taskRouter)

const PORT = process.env.PORT || 3000
app.listen(PORT, (err, suc) => {
    if(err) throw err

    console.log(`${PORT} port running`)
})