const express = require('express')
const bodyParser = require('body-parser');
const cors = require('cors');
const multer=require('multer');


var sql = require('./connection.js');
const app = express()
var http = require('http').Server(app);
const port = 8080
const path = require('path');

app.use(cors());
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
/* Session */
var session=require('express-session');
const { type } = require('os');
app.use(session({
	secret: 'check Login',
	resave: true,
    saveUninitialized: true,
    loggedIn:false,
    userName:'',
    cookie:{maxAge:60000000}
}));
/* */
var checkLogin = require('./checkLogin')(app);
var logout = require('./logout')(app);
var giveReviews = require('./giveReviews')(app);
var filename="";
var realFileName=""
var checkFile="";
/* Setting the uploaded File  */
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
      cb(null, 'uploads');
  },
  filename: (req, file, cb) => {
      console.log(file);
filename=Date.now() + path.extname(file.originalname);
realFileName=file.originalname;
      cb(null, filename);
  }
});
const fileFilter = (req, file, cb) => {
  if (path.extname(file.originalname) == '.pdf' ) {
    checkFile=true;
      cb(null, true);

  } else {
      checkFile=false;
      cb(null, false);
  }
}
const upload = multer({ storage: storage, fileFilter: fileFilter });
/* End */

app.post('/upload', upload.single('image'), (req, res, next) => {
  try {
    if(req.body.types=='file'){
      var saveData={
       Files : filename,
       types : req.body.types,
       user_email:req.session.userName,
       realName:req.body.name

      }
    sql.query('INSERT INTO files SET ?', saveData, function(error, results, fields) {

      return res.status(200).json({
        message: 'File uploded successfully',
        filename:filename,
        checkFile:checkFile,
        user_email:req.session.userName
        
    });
      });
    }
    else if(req.body.types=='url'){
      var saveData={
        Files : req.body.image,
        types : req.body.types,
        user_email:req.session.userName,
        realName:req.body.name

       }
       console.log("URL UPLOADED")
     sql.query('INSERT INTO files SET ?', saveData, function(error, results, fields) {
console.log(error)
       return res.status(200).json({
         message: 'URL uploded successfully',

     });
       });

    }



  } catch (error) {
      console.error(error);
  }
})

app.get('/', function(request, response) {
	response.sendFile(path.join(__dirname + '/views/helloWorld.html'));
});

//SignUp File
app.get('/signup', function(request, response) {
	response.sendFile(path.join(__dirname + '/views/signup.html'));
});

//SignUp Post
app.post('/signup',function(request,response){
	var username = request.body.username;
  var password = request.body.password;
  var subject = request.body.subject;
  var userData = {
    email: username,
    password: password,
    subject: subject,

  };
	if(username && password && subject) {
		sql.query('INSERT INTO User SET ?', userData, function(error, results, fields) {
			if (!error) {
				request.session.loggedIn = true;
				request.session.userName= username;
				response.redirect('/');
			} else {
				response.send(error);
			}
			response.end();
		});
	} else {
		response.send('Please enter all Fields');
		response.end();
	}

}
)
//Login
app.get('/login', function(request, response) {
	response.sendFile(path.join(__dirname + '/views/login.html'));
});


app.post('/login', function(request, response) {
  var username = request.body.username;
  var password = request.body.password;

  if(username && password) {
      sql.query('SELECT * FROM user WHERE email = ? AND password = ?', [username, password], function(error, results, fields) {
          if (!error && results.length > 0) {
              request.session.loggedIn = true;
              request.session.userName = username;
              response.redirect('/');
          } else {
              response.send('Incorrect username or password');
              response.end();
          }
      });
  } else {
      response.send('Please enter all Fields');
      response.end();
  }
});

//
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})