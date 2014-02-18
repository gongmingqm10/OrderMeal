angular.module('OrderMeal:Common').factory 'api', ['$cookies','$http', ($cookies, $http)->
  _current_user = jQuery.parseJSON($cookies.user) if $cookies.user?

  current_user: ->
    _current_user || ''

  user_create_food_new: (success_handler, error_handler) ->
    uri = "api/users/#{_current_user.id}/foods/new"
    $http.get(uri)
    .success(success_handler)
    .error(error_handler)

  user_create_food: (data, success_handler, error_handler) ->
    uri = "api/users/#{_current_user.id}/foods"
    $http.post(uri, data)
    .success(success_handler)
    .error(error_handler)

  user_index_all_food: (success_handler, error_handler) ->
    uri = "api/users/#{_current_user.id}/foods"
    $http.get(uri)
    .success(success_handler)
    .error(error_handler)

  index_all_food: (success_handler, error_handler) ->
    uri = "api/foods"
    $http.get(uri)
    .success(success_handler)
    .error(error_handler)

  user_update_food: (food_id, data, success_handler, error_handler) ->
    uri = "api/users/#{_current_user.id}/foods/#{food_id}"
    $http.put(uri, data)
    .success(success_handler)
    .error(error_handler)

  user_get_food_by_id: (food_id, success_handler) ->
    uri = "api/users/#{_current_user.id}/foods/#{food_id}/edit"
    $http.get(uri).success(success_handler)

  user_delete_food: (food_id, success_handler) ->
    uri = "api/users/#{_current_user.id}/foods/#{food_id}"
    $http.delete(uri).success(success_handler)
]