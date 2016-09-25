var express = require('express')

var Busboy = require('busboy'), //
inspect = require('util').inspect;

module.exports = function(pool) {
    'use strict';
    var router = express.Router();


    router.get('/getPaises', function(req, res) {
        pool.getConnection(function(err, connection) {
            connection.query('CALL getPaises()', function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/getEstados', function(req, res) {
        pool.getConnection(function(err, connection) {
            connection.query('CALL getEstados(?)', function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });


    router.post('/login', function(req, res) {
        pool.getConnection(function(err, connection) {
            connection.query('CALL Login(?,?,?,?)', function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });
    return router;
};
