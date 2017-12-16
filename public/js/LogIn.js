'use strict';

$(document).ready(function() {
  var name,
      email,
      password,
      password_confirmation;

  function cleanFields() {
    $('#email').val('')
    $('#password').val('')
    $('#password_confirmation').val('')
  }

  function getValues() {
    email = $('#email').val()
    password = $('#password').val()
    password_confirmation = $('#password_confirmation').val()
  }

  function getUserPage() {
    $.get('/users', { user: { email: email,
                               password: password,
                               password_confirmation: password_confirmation }})
  }

  $('#logInUser').click(function() {
    getValues()
    getUserPage()
    cleanFields()
  })
})
