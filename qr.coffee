qr = require 'qrcode'
_ = require 'underscore'
mapobj = require 'map-obj'

qr.QRCodeDraw.prototype.scale = 6
qr.QRCodeDraw.prototype.defaultMargin = 10
qr.QRCodeDraw.prototype.marginScaleFactor = 0
qr.QRCodeDraw.prototype.color.dark = '#000000'
#qr.QRCodeDraw.prototype.color.light = 'rgba(0,0,0,0)'

qr_opts = {errorCorrectLevel: "minimum"}

tryparse = (key, value) ->
    [key, parseInt value]

module.exports = (s, opts, cb) ->
    qr.draw s, _.extend({}, mapobj(opts, tryparse), qr_opts), (err, canvas) ->
        cb err, err? || canvas.toBuffer()

