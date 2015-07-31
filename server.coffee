qr = require './qr'
polar = require 'polar'

DEBUG = process.env.QRTLE_DEBUG

app = polar.setup_app
    port: 1414
    metaserve: compilers:
        css: [
            require('metaserve-bouncer')
                base_dir: './static/css'
                enabled: !DEBUG
            require('metaserve-css-styl')()
        ]
        js: [
            require('metaserve-bouncer')
                base_dir: './static/js'
                enabled: !DEBUG
            require('metaserve-js-coffee-reactify')(ext: 'coffee')
        ]

app.get '/', (req, res) -> res.render 'home'

app.get '/qr', (req, res) ->
    qr.draw req.query.text, req.query, (err, buffer) ->
        res.end buffer

app.get '/qr/:text', (req, res) ->
    qr.draw req.params.text, req.query, (err, buffer) ->
        console.error err if err
        res.end buffer

app.get '/qr.txt/:text', (req, res) ->
    qr.array req.params.text, req.query, (err, bits) ->
        console.error err if err
        res.end bits.join('')

app.start()

