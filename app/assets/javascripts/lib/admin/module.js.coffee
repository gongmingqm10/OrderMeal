angular.module('OrderMeal:Admin', ['OrderMeal:Common', 'ngRoute'])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when('/all', {templateUrl: 'admin/all', controller: 'AdminAllController'})
      .when('/new', {templateUrl: 'admin/new', controller: 'AdminFoodNewController'})
      .when('/edit/:food_id', {templateUrl: 'admin/edit', controller: 'AdminFoodEditController'})
      .otherwise(redirectTo: '/all')
]