const express = require('express')
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();



module.exports = function(app){

    app.get('/checkLogin', function(req, res){

        console.log(req.session.userName)
       if(typeof req.session.userName !== 'undefined'){
       res.json(true);
       }
       else{
        res.json(false);
       }
    });

    //other routes..
}
