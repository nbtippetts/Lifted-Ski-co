  var app = require('./server');

  module.exports = {

    newUser: function(req, res, next){
      var db = app.get('db');

      db.create_product([req.body.username, req.body.email, req.body.password], function(err, user){
        res.send(user)
      })
    },

    getSki: function(req, res, next){
      var db = app.get('db');

      db.read_product([req.query.id], function(err, ski){
          res.send(ski);
      })
    },

    getAll: function(req, res, next){
      var db = app.get('db');

      db.read_products(function(err, skis){
        res.send(skis)
      })
    },

    getSkiPoles: function(req, res, next){
      var db = app.get('db');

      db.read_pole([req.query.id], function(err, pole){
          res.send(pole);
      })
    },

    getAllPoles: function(req, res, next){
      var db = app.get('db');

      db.read_poles(function(err, poles){
        res.send(poles)
      })
    },

    getTeam: function(req, res, next) {
      var db = app.get('db');

      db.read_team([req.query.id], function(err, team) {
        res.send(team)
      })
    },

    getTeams: function(req, res, next) {
      var db = app.get('db');

      db.read_teams(function(err, teams) {
        res.send(teams)
      })
    }

  }
