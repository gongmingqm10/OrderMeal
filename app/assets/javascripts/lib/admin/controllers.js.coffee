angular.module('OrderMeal:Admin').controller 'AdminController', ['$scope', '$location', 'api', ($scope, $location, api) ->
  $scope.reset_food = ->
    $scope.food =
      name: '',
      price: '',
      describe: '',
      picture: ''

  $scope.cancel = ->
    $location.url('/all')

  $scope.upload_image = ->
    file_data = $('#file').prop('files')[0]
    form_data = new FormData();
    form_data.append("file", file_data)
    $.ajax
      url: "/api/file-upload",
      dataType: 'json',
      cache: false,
      contentType: false,
      processData: false,
      data: form_data,
      type: 'post',
      success: upload_on_success,
      error: upload_on_error
    return

  $scope.food_success_handler = ->
    $location.url('/all')
    $scope.error = ""

  $scope.food_error_handler = ->
    $scope.error = "数据保存失败，服务器正在努力恢复中..."

  upload_on_success = (response_data)->
    $('.food-image').attr('src', response_data.url)
    $scope.food.picture = response_data.url
    $scope.error = "" if $scope.error

  upload_on_error = (data)->
    $scope.error = "创建菜品失败，服务器正在努力恢复中..."
]

angular.module('OrderMeal:Admin').controller 'AdminAllController', ['$scope', '$location', '$timeout', 'api', ($scope, $location, $timeout, api) ->

  index_success_handler = (data) ->
    $scope.foods = data
    $scope.foods_length = data.length
    $scope.error = ""

  index_error_handler = ->
    $scope.error = "抱歉，服务器正在努力恢复中..."

  remove_foods_by_id = (id) ->
    _.each $scope.foods, (food, index) ->
      if food.food.food_id == id
        $scope.foods.splice(index, 1)
        return

  $scope.foods_new = ->
    $location.url('/new')

  $scope.index_food = (food_id) ->
    $location.url('/food/'+food_id)

  $scope.edit_food = (food_id) ->
    $location.url('/edit/'+food_id)
    return true


  $scope.delete_food = (food_id) ->
    $scope.delete_food_id = food_id
    $('#ok').data('id', food_id)
    $('#deleteConfirm').modal('show')
    return true

  $('#ok').on 'click', () ->
    id = $(this).data('id')
    api.user_delete_food $scope.delete_food_id, () ->
      $timeout ->
        remove_foods_by_id(id)
      ,
        100
    $('#deleteConfirm').modal('hide')

  api.user_index_all_food index_success_handler, index_error_handler

]

angular.module('OrderMeal:Admin').controller 'AdminFoodNewController', ['$scope', '$location', 'api', ($scope, $location, api) ->

  $scope.reset_food()

  $scope.create_food = ->
    api.user_create_food $scope.food, $scope.food_success_handler, $scope.food_error_handler

]

angular.module('OrderMeal:Admin').controller 'AdminFoodEditController', ['$scope', '$routeParams', '$location', 'api', ($scope, $routeParams, $location, api) ->

  $scope.food_id = $routeParams.food_id

  api.user_get_food_by_id $scope.food_id, (data) ->
    $scope.food = data.food

  $scope.update_food = ->
    api.user_update_food $scope.food_id, $scope.food, $scope.food_success_handler, $scope.food_error_handler

]

angular.module('OrderMeal:Admin').controller 'AdminFoodIndexController', ['$scope', '$routeParams', '$location', 'api', ($scope, $routeParams, $location, api) ->

  $scope.food_id = $routeParams.food_id

  api.user_get_food_by_id $scope.food_id, (data) ->
    $scope.food = data.food


]