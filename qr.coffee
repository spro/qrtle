qr = require 'qrcode'
_ = require 'underscore'
mapobj = require 'map-obj'

qr.QRCodeDraw.prototype.scale = 6
qr.QRCodeDraw.prototype.defaultMargin = 0
qr.QRCodeDraw.prototype.marginScaleFactor = 0
qr.QRCodeDraw.prototype.color.dark = '#000000'
#qr.QRCodeDraw.prototype.color.light = 'rgba(0,0,0,0)'

qr_opts = {errorCorrectLevel: "minimum"}

makeOpts = (opts) ->
    _.extend({}, mapobj(opts, tryparse), qr_opts)

tryparse = (key, value) ->
    [key, parseInt value]

array = (s, opts, cb) ->
    qr.drawBitArray s, makeOpts(opts), (err, bits) ->
        cb err, bits

draw = (s, opts, cb) ->
    qr.draw s, makeOpts(opts), (err, canvas) ->
        if err
            cb err
        else
            cb null, canvas.toBuffer()

module.exports = {draw, array}

