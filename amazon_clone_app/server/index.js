//IMPORTS FROM PACAGES
const {securityKeys} = require('../securityKeys/constants')
const express = require('express');
const mongoose = require('mongoose');


//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');
const adminRouter = require('./routes/admin');
const productRouter = require('./routes/product');


//INITS
const PORT = 3000;
const app = express();
//Added security key
const DB = securityKeys.dbKey;
//middleware
//CLient -> middleware -> Server -> Client
app.use(express.json())
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);

// Creating an api

//Connections
mongoose.connect(DB).then(() => {
    console.log("Connection successful");
}).catch((e) => {
    console.log(e);
})

app.listen(PORT, "0.0.0.0", () => {
    console.log(`LoL Connected at port ${PORT}` );
} );
