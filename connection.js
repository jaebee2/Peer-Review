'user strict';

var mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'student_portal'
  })
  connection.connect(function(err) {
    if (err) throw err;
    console.log("Connected to Sql")
});

module.exports = connection;
