$ = require 'jquery'

$('#create').on 'submit', (e) ->
    e.preventDefault()

    encoded = encodeURIComponent $('input[name=text]').val()
    $('#preview').attr 'src', null
    $('#preview').attr 'src', '/qr/' + encoded

$('input').focus()
