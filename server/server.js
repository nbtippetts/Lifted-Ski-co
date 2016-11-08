  var express = require('express');
  var bodyParser = require('body-parser');
  var session = require('express-session');
  var cors = require('cors');
  var massive = require('massive');
  var connectionString = "postgres://postgres:otb4life@localhost/skiCo";
  var config = require('./config.js');


  var app = module.exports = express();
  var massiveServer = massive.connectSync({connectionString: connectionString});

  var corsOptions = {
    origin: 'http://localhost:2244'
  };


  app.use(bodyParser.json());
  app.use(cors('corsOptions'));
  app.use(session({
    secret: config.sessionSecret,
    saveUninitialized: false,
    resave: false
  }));

  app.set('db', massiveServer);

  app.use(express.static('public'));
  console.log('this is dirname', __dirname)

  var db = app.get('db');

  var serverCtrl = require('./productCtrl');

  app.get('/api/skis/ski:id', serverCtrl.getSki);

  app.get('/api/skis', serverCtrl.getAll);

  app.get('/api/poles/pole:id', serverCtrl.getSkiPoles);

  app.get('/api/poles', serverCtrl.getAllPoles);

  app.get('/api/teams', serverCtrl.getTeams);

  app.get('/api/teams/team:id', serverCtrl.getTeam);

  app.post('/api/user', serverCtrl.newUser);


  var port = 2244;
  app.listen(port, function(){
    console.log('send it', port);
  })
