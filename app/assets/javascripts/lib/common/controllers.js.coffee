angular.module('OrderMeal:Common').controller 'UserPanelController', ['$scope', '$location', 'api', ($scope, $location, api) ->
  $scope.display_name = api.current_user().username

]