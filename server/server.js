  var fs = require('fs');
  var https = require('https');

  var express = require('express');
  var bodyParser = require('body-parser');
  var cookieParser = require('cookie-parser');
  var session = require('express-session');
  var cors = require('cors');
  var massive = require('massive');
  var passport = require('passport');
  var LocalStrategy = require('passport-local').Strategy;
  var passportHttp = require('passport-http');
  var connectionString = "postgres://postgres:otb4life@localhost/skiCo";
  var config = require('./config.js');
  var port = 2244;


  var app = module.exports = express();

  var server = https.createServer({
    cert: fs.readFileSync(__dirname + '/my.crt'),
    key: fs.readFileSync(__dirname + '/my.key')
   }, app);


  var massiveServer = massive.connectSync({connectionString: connectionString});


  var corsOptions = {
    origin: 'http://localhost:2244'
  };


  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: false }));
  app.use(cookieParser());
  app.use(cors('corsOptions'));
  app.use(session({
    secret: config.sessionSecret,
    saveUninitialized: true,
    resave: true
  }));

  app.use(passport.initialize());
  app.use(passport.session());

  app.use(express.static('public'));
  console.log('this is dirname', __dirname)

  app.set('db', massiveServer);


  var db = app.get('db');

  passport.use(new LocalStrategy(varifyCred));

  passport.use(new passportHttp.BasicStrategy(varifyCred));

    function varifyCred(username, password, done) {
      db.users.findOne({username: username}, function(err, user) {
        if (err) { return done(err); }
        if (!user) { return done(null, false); }
        if (user.password != password) { return done(null, false); }
        return done(null, user);
        })
      }


  passport.serializeUser(function(user, done) {
  done(null, user.id);
  })

  passport.deserializeUser(function(id, done) {
    db.get_userId([id], function(err, user) {
      user = user[0];
      if (err) console.log(err);
      else console.log('RETRIEVED USER');
      console.log(user);
      done(null, user);
    })
  })

  function ensureAuthenticated(req, res, next) {
    if (req.user) {
      next()
    } else {
      res.status(404)
    }
  }


  app.get('/auth/me', function(req, res) {
    if (!req.user) return res.sendStatus(404);
    else res.status(200).send(req.user);
  })

  app.post('/auth/local', passport.authenticate('local'), function(req, res) {
    res.status(200).send();
  });


  app.get('/auth/logout', function(req, res) {
    req.logout();
    res.redirect('/');
  })

  app.use('/api', passport.authenticate('basic', { session: false }));

  app.get('/api/data', function(req, res){
    res.status(200).send(req.user.username);
  })

  var serverCtrl = require('./productCtrl');
  var userCtrl = require('./userCtrl');

  app.get('/api/skis/ski:id', serverCtrl.getSki);

  app.get('/api/skis', serverCtrl.getAll);

  app.get('/api/poles/pole:id', serverCtrl.getSkiPoles);

  app.get('/api/poles', serverCtrl.getAllPoles);

  app.get('/api/teams', serverCtrl.getTeams);

  app.get('/api/teams/team:id', serverCtrl.getTeam);

  app.post('/api/user', userCtrl.newUser);

  //app.get('/api/users/user:id?id=', userCtrl.getUserId);



  server.listen(port, function(){
    console.log('send it', port);
  })
