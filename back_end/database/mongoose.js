const mongoose = require('mongoose')
require('dotenv').config()

const connection = process.env.DB_CONNECTION_PATH

mongoose.connect(connection, {
    useCreateIndex : true,
    useNewUrlParser : true,
    useUnifiedTopology : true,
    useFindAndModify : false
}).then((suc) => console.log("Connected to database."))
.catch((err) => log(`Error during connection ${err}`))