# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.

# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.

# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.

# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
# = require jquery
# = require jquery_ujs
# = require turbolinks
# = require angular
# = require angular-route
# = require angular-resource
# = require angular-sanitize
# = require angular-devise
# = require bootstrap-sprockets
# = require_tree .


app = angular.module("PlanificaViajes", ["Devise", "PlanificaViajes.Trips"])



app.config (AuthProvider) ->
  AuthProvider.loginPath "/auth/login.json"
  AuthProvider.logoutPath "/auth/logout.json"
  AuthProvider.registerPath "/auth/register/new.json"
  AuthProvider.ignoreAuth true



  return

app.controller "login",
  ($scope, Auth, $http) ->

    errorOnLogin = false
    $scope.errorOnLogin = () ->

      return errorOnLogin

    $scope.formInfo = {}

    $scope.is_login = ->
      Auth.isAuthenticated()

    Auth.currentUser().then ((user) ->
      $scope.username = user.username
      return
    ), (error) ->
      return

    $scope.logout = (form) ->
      Auth.logout().then ((oldUser) ->
        location.reload()
        return
      ), (error) ->
        console.log "Error logout"
        return

      return

    $scope.login = () ->

      credentials =
        login: $scope.formInfo.email
        password: $scope.formInfo.password

      Auth.login(credentials).then ((user) ->
        $scope.username = user.username
        location.reload()
        return
      ), (error) ->
        console.log "Credenciales no válidas"
        errorOnLogin = true
        $(".control-label").show()
        return

      return

$ ->

  $(".navHome button").on "click", ->
    $("body").toggleClass "is-activeNav"

  return