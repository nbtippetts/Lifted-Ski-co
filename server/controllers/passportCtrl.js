// var app = require('../server');
// var Sequelize = require('sequelize');
// var fs = require('fs');
// var https = require('https');
//
// var passport = require('passport');
// var LocalStrategy = require('passport-local').Strategy;
// var massive = require('massive');
//  var db = app.get('db');
//
//
//
//
//  passport.serializeUser(function(user, done) {
//  done(null, user);
//  });
//
//  passport.deserializeUser(function(id, done) {
//    db.get_userId([id], function(err, user) {
//      user = user[0];
//      if (err) done(err, null);
//      else console.log('RETRIEVED USER');
//      //console.log('username', user);
//      done(null, user.id);
//    });
//  });
//
//   passport.use(new LocalStrategy(
//   function varifyCred(email, password, done) {
//     db.users.findOne({email: email}, function(err, user) {
//       if (err) { return done(err); }
//       if (!user) { return done(null, false); }
//       if (user.password != password) { return done(null, false); }
//       return done(null, user);
//     });
//   }))
//   //^^^the function for LocalStrategy and passportHttp.BasicStrategy
//
//
//
//   //serializeUser and deserializeUser does something neat.
//   //I dont know what they do but you need it for passport
//   //Ill look into it later
//
//
//   function ensureAuthenticated(req, res, next) {
//     if (req.isAuthenticated()) {
//       next();
//     } else {
//       next(new Error(401))
//     }
//   }
//   // //we want to ensureAuthenticated to make sure that it is a user in the database and for better security
//   //
//
//
//
// module.exports = {
//   register: function(req, res, next) {
//     var db = app.get('db');
//
//     db.create_user([req.body.firstname, req.body.lastname, req.body.email, req.body.password], function(err, user) {
//        if (err) res.status().sendStatus(404);
//        else res.redirect('/#/skis')
//     })
//   }
// };
