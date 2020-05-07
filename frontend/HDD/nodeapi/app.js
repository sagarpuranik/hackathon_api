var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var cors = require('cors');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var getDataRouter = require('./routes/getData')
var getTableRouter = require('./routes/getTable')

//sql connection
var sql= require('./public/javascripts/SQLConnect');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.set('view cache', false);

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);


var corsOption = 
{
  origin : "*",
  optionsSuccessStatus : 200
};
app.use(cors(corsOption));


sql.connect();

// app.use('/getdata',getDataRouter)
app.use('/getdata',async function(req,res,next) { 
  data = []  
  data[0] = await sql.executeStatement2(res,req.query.serverName,req.query.comp_date);
  data[1] = await sql.executeStatement(res);
  // console.log(data);
  res.send(data);
  }); 
app.use('/gettable',getTableRouter)

app.use('/getgphdata',async function(req,res,next) { 
  data = await sql.executeStatement2(res,req.query.serverName,req.query.comp_date);
  // console.log(data);
  console.log("inside app.js getgphdata "+req.query.serverName+req.query.comp_date);
  res.send(data);
  });

// catch 404 and forward to error handler
// app.use(function (req, res, next) {
//   next(createError(404));
// });

// // error handler
// app.use(function (err, req, res, next) {
//   // set locals, only providing error in development
//   res.locals.message = err.message;
//   res.locals.error = req.app.get('env') === 'development' ? err : {};

//   // render the error page
//   res.status(err.status || 500);
//   res.render('error');
// });


module.exports = app;
