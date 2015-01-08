qr = require './qr'
polar = require 'polar'

DEBUG = true

app = polar.setup_app
    port: 1414
    metaserve: compilers:
        'js\/(.*)\.js': [
            require('metaserve/src/compilers/raw/bouncer')
                base_dir: './static/js'
                ext: 'bounced.js'
                enabled: !DEBUG
            require('metaserve/src/compilers/js/browserify-coffee-jsx')
                ext: 'coffee'
        ]

app.get '/', (req, res) -> res.render 'home'

app.get '/qr', (req, res) ->
    qr req.query.text, req.query, (err, buffer) ->
        res.end buffer

app.get '/qr/:text', (req, res) ->
    qr req.params.text, req.query, (err, buffer) ->
        console.error err if err
        res.end buffer

app.start()

