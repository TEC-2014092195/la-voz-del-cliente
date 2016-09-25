var express = require('express');

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
        console.log(req.body);
        pool.getConnection(function(err, connection) {
            connection.query('CALL getEstados(?)',[req.body.Id], function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.get('/getSectores', function(req, res) {
        pool.getConnection(function(err, connection) {
            connection.query('CALL getSectores()', function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.get('/getGeneros', function(req, res) {
        pool.getConnection(function(err, connection) {
            connection.query('CALL getGeneros()', function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/insertUsuario', function(req, res) {
        console.log(req.body);

        pool.getConnection(function(err, connection) {
            connection.query('CALL insertUsuario(?,?,?,?)',[req.body.nombreusuario,req.body.nombrecompleto,req.body.clave,req.body.correo], function(err, rows) {
                if (err) throw err;
                console.log('Last insert ID:', rows.insertId);
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/insertPYME', function(req, res) {
        console.log(req.body);
        var d = req.body;

        var values = [d.nombreComercial,d.estado.Id, d.sector.Id, d.inicioOperaciones, d.telefono, d.direccion, d.activa,d.familiar, d.foto, d.extension, false, d.usuario[0].ID, d.generoPropietario.Id,d.identificacion];
        console.log(values);
        pool.getConnection(function(err, connection) {
            connection.query('CALL insertPYME(?,?,?,?,?,?,?,?,?,?,?,?,?,?)',values, function(err, rows) {
                if (err) throw err;
                console.log('Last insert ID:', rows.insertId);
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/insertRedesSociales', function(req, res) {
        var d = req.body;

        var values = [d.pyme,d.facebookDir,d.twitterDir,d.youtubeDir,d.siteDir,d.linkedDir];
        console.log(values);
        pool.getConnection(function(err, connection) {
            connection.query('CALL insertRedesSociales(?,?,?,?,?,?)',values, function(err, rows) {
                if (err) throw err;
                console.log('Last insert ID:', rows.insertId);
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/validarSesion', function(req, res) {
        var d = req.body;
        //console.log(d);
        var values = [d.NombreComercial,d.NombreUsuario,d.pais.Id,d.Password];
        console.log(values);
        pool.getConnection(function(err, connection) {
            connection.query('CALL validarSesion(?,?,?,?)',values, function(err, rows) {
                if (err) throw err;
                res.send(rows[0]);
                connection.release();
            });
        });
    });

    router.post('/updatePYME', function(req, res) {
        var d = req.body;
        //console.log(d);
        var values = [d.pymeID,d.estado.Id, d.sector.Id, d.inicioOperaciones, d.telefono, d.direccion, d.activa, d.familiar, d.generoPropietario.Id,d.identificacion];
        console.log(values);
        pool.getConnection(function(err, connection) {
            connection.query('CALL updatePYME(?,?,?,?,?,?,?,?,?,?)',values, function(err, rows) {
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
