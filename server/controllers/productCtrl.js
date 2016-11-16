var app = require('../server.js');
var db = app.get('db');

module.exports = {
 //  getSki: function(req, res, next){
 //   var db = app.get('db');
 //
 //   db.read_product([req.query.id], function(err, ski){
 //       res.send(ski);
 //   })
 // },
 //
 // getAll: function(req, res, next){
 //   var db = app.get('db');
 //
 //   db.read_products(function(err, skis){
 //     res.send(skis)
 //   })
 // },
 //
 // getSkiPoles: function(req, res, next){
 //   var db = app.get('db');
 //
 //   db.read_pole([req.query.id], function(err, pole){
 //       res.send(pole);
 //   })
 // },
 //
 // getAllPoles: function(req, res, next){
 //   var db = app.get('db');
 //
 //   db.read_poles(function(err, poles){
 //     res.send(poles)
 //   })
 // },
 //
 // getTeam: function(req, res, next) {
 //   var db = app.get('db');
 //
 //   db.read_team([req.query.id], function(err, team) {
 //     res.send(team)
 //   })
 // },
 //
 // getTeams: function(req, res, next) {
 //   var db = app.get('db');
 //
 //   db.read_teams(function(err, teams) {
 //     res.send(teams)
 //   })
 // }

    createProduct: function(req, res) {
        var params = [req.body.product_name, req.body.product_description, req.body.product_price, req.body.product_image_url];
        db.products.create_product(params,
            function(err, result) {
                console.log(err);
                console.log(result);
                res.status(200).json(result);
            });
    },
    updateProduct: function(req, res) {
        var params = [req.body.product_name, req.body.product_description, req.body.product_price, req.body.product_image_url, req.body.product_id];
        db.products.update_product(params,
            function(err, result) {
                console.log(err);
                console.log(result);
                res.status(200).json('Product has been updated.');
            });
    },
    deleteProduct: function(req, res) {
        var id = [req.params.id];
        db.products.delete_product(id,
            function(err, result) {
                console.log(err);
                console.log(result);
                res.status(200).json('Product has been deleted.');
            });
    },
    getProduct: function(req, res) {
        var id = [req.params.id];
        db.products.read_product(id,
            function(err, result) {
                console.log(err);
                console.log(result);
                res.status(200).json(result);
            });
    },
    getAllProducts: function(req, res) {
        db.products.read_products(
            function(err, result) {
                console.log(err);
                console.log(result);
                res.status(200).json(result);
            });
    }
};
