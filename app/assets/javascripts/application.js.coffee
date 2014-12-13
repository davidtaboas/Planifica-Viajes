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



$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  message = element.data('confirm')
  # If there's no message, there's no data-confirm attribute,
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
    # We don't necessarily want the same styling as the original link/button.
    .removeAttr('class')
    # We don't want to pop up another confirmation (recursion)
    .removeAttr('data-confirm')
    # We want a button
    .addClass('btn').addClass('btn-danger')
    # We want it to sound confirmy
    .html(I18n.t("general.yesSure"))

  # Create the modal box with the message
    modal_html = """
                 <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                     <a class="close" data-dismiss="modal">×</a>
                     <h3>#{message}</h3>
                   </div>
                   <div class="modal-body">
                     <p>"""+I18n.t('general.sure')+"""</p>
                     <p>"""+I18n.t('general.noTurningBack')+"""</p>
                   </div>
                   <div class="modal-footer">
                     <button class="btn" data-dismiss="modal" aria-hidden="true">"""+I18n.t('general.cancel')+"""</button>
                   </div>
                 </div>
                </div>
               </div>
                 """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal()
  # Prevent the original link from working
  return false

app = angular.module("PlanificaViajes", ["Devise", "PlanificaViajes.Trips"])



app.config (AuthProvider) ->
  AuthProvider.loginPath "/auth/login.json"
  AuthProvider.logoutPath "/auth/logout.json"
  AuthProvider.registerPath "/auth/register/new.json"
  AuthProvider.interceptAuth true



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