//IMPORTS FROM PACAGES
const express = require('express');
const mongoose = require('mongoose');

//IMPORTS FROM OTHER FILES
const authRouter = require('./routes/auth');;

//INITS
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://emsar:Emsika170900!@cluster0.blbuwog.mongodb.net/?retryWrites=true&w=majority"

//middleware
//CLient -> middleware -> Server -> Client
app.use(express.json())
app.use(authRouter);


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
