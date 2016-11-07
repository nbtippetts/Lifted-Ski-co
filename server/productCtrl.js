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
    }

  }
