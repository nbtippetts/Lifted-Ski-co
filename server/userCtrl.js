var app = require('./server');

module.exports = {

  newUser: function(req, res, next){
    var db = app.get('db');

    db.create_user([req.body.username, req.body.password], function(err, user){
            if (user) res.redirect('/');
           console.log("backendCTRL this is user", user);
     })
  }


  // getUserId: function(req, res, next){
  //   var db = app.get('db');
  //
  //   db.get_userId([req.query.id], function(err, user){
  //   //  console.log("backend CTRL this is err", err)
  //     console.log("backendCTRL this is user id", user)
  //     res.send(user)
  //   })
  // },
}
