angular.module('OrderMeal:Login').controller 'LoginController', ['$scope', ($scope) ->
  $scope.user =
    username: ""
    password: ""
  $scope.reset = ->
    $scope.loginForm.$setPristine()
    $scope.user.username = ''
    $scope.user.password = ''

]