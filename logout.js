const express = require('express')
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();



module.exports = function(app){

    app.get('/logout', function(req, res){

        console.log(req.session.userName)
       if(typeof req.session.userName !== 'undefined'){


        // destroy session data
        req.session.userName = undefined;

        res.redirect('/');
       }
       else{

       }
    });

    //other routes..
}