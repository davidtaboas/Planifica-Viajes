(function() {
  var app;

  app = angular.module("PlanificaViajes", ["Devise", "PlanificaViajes.Trips"]);

  app.config(function(AuthProvider) {
    AuthProvider.loginPath("/auth/login.json");
    AuthProvider.logoutPath("/auth/logout.json");
    AuthProvider.registerPath("/auth/register/new.json");
    AuthProvider.ignoreAuth(true);
  });

  app.controller("login", function($scope, Auth, $http) {
    var errorOnLogin;
    errorOnLogin = false;
    $scope.errorOnLogin = function() {
      return errorOnLogin;
    };
    $scope.formInfo = {};
    $scope.is_login = function() {
      return Auth.isAuthenticated();
    };
    Auth.currentUser().then((function(user) {
      $scope.username = user.username;
    }), function(error) {});
    $scope.logout = function(form) {
      Auth.logout().then((function(oldUser) {
        location.reload();
      }), function(error) {
        console.log("Error logout");
      });
    };
    return $scope.login = function() {
      var credentials;
      credentials = {
        login: $scope.formInfo.email,
        password: $scope.formInfo.password
      };
      Auth.login(credentials).then((function(user) {
        $scope.username = user.username;
        location.reload();
      }), function(error) {
        console.log("Credenciales no válidas");
        errorOnLogin = true;
        $(".control-label").show();
      });
    };
  });

  $(function() {
    $(".navHome button").on("click", function() {
      return $("body").toggleClass("is-activeNav");
    });
  });

}).call(this);
