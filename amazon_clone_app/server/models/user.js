const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    name: {
        requred: true,
        type: String,
        trim: true
    },
    email:{
        required: true,
        type: String,
        trim: true,
        validate:{
            validator: (value) => {
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                
               return value.match(re);
            },
            message: 'Please enter a valid email adress',
        }
    },
    password:{
        require: true,
        type: String,
        
    },
    
    address:{
        type: String,
        default:'',
    },
    type:{
        type: String,
        default:'user',

    },
    //cart
})

const User = mongoose.model('User', userSchema);
module.exports = User;