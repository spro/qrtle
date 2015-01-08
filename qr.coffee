qr = require 'qrcode'
qr.QRCodeDraw.prototype.scale = 6
qr.QRCodeDraw.prototype.defaultMargin = 0
qr.QRCodeDraw.prototype.marginScaleFactor = 0
qr.QRCodeDraw.prototype.color.dark = '#111111'
qr.QRCodeDraw.prototype.color.light = 'rgba(0,0,0,0)'

qr_opts = {errorCorrectLevel: "minimum"}

module.exports = (s, cb) ->
    qr.draw s, qr_opts, (err, canvas) ->
        cb err, err? || canvas.toBuffer()

