const express = require('express')
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const path = require('path');

var sql = require('./connection.js');
const { json } = require('body-parser');
app.use(cors());
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
var id=0;
module.exports = function(app){

    app.get('/giveReviews', function(req, res){

        res.sendFile(path.join(__dirname + '/views/giveReviews.html'));

    });
    app.get('/getReviews', function(req, res){
sql.query("SELECT * FROM files", function (err, result, fields) {
            if (err) throw err;

            return res.status(200).json(result);
          });

    });
    app.get('/postReviews', function(req, res){
       id=req.query.id
        res.sendFile(path.join(__dirname + '/views/postReviews.html'));

            });
    app.get('/downloadFile',function(req,res){

sql.query("SELECT Files,types FROM files WHERE id="+id, function (err, result, fields) {
            if (err) throw err;

if(result[0].types=='file'){
const file = `${__dirname}/uploads/${result[0].Files}`;

            res.download(file);
}
else{
res.json({"result":result[0].Files,"file":"url"})
}

          });



            });
            app.post('/postReviewSave',function(req,res){
                postReview={
                    "files_id":id,
                    "review":req.body.rating,
                    "feedback":req.body.commentText,
                    "user_email":req.session.userName
                }

                sql.query('INSERT INTO review SET ?', postReview, function(error, results, fields) {
              console.log(req.body);

                    res.redirect('/')
                    });

              })

          app.get('/mypdfReviews',function(req,res){
            sql.query('SELECT files.realName, files.types,review.review,review.user_email,review.feedback FROM files JOIN review ON files.id = review.files_id',function(error, results, fields) {
            console.log(results);

            res.json(results);



                      });
          });


          app.get('/mypdfpage',function(req,res){

            res.sendFile(path.join(__dirname + '/views/myReviews.html'));

          })


    //other routes..
}