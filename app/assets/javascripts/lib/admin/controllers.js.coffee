angular.module('OrderMeal:Admin').controller 'AdminController', ['$scope', 'api', ($scope, api) ->

]

angular.module('OrderMeal:Admin').controller 'AdminAllController', ['$scope', '$location', 'api', ($scope, $location, api) ->

  $scope.foods_new = ->
    $location.url('/new')

  success_handler = (data) ->
    $scope.foods = data
    $scope.foods_length = data.length

  error_handler = ->

  api.user_index_all_food success_handler, error_handler

  $scope.edit_food = (food_id) ->
    $location.url('/edit/'+food_id)

  $scope.delete_food = (food_id) ->
    $scope.delete_food_id = food_id
    $('#deleteConfirm').modal('show')
    return

  $('#ok').on 'click', () ->
    api.user_delete_food $scope.delete_food_id, () ->
      api.user_index_all_food success_handler, error_handler
    $('#deleteConfirm').modal('hide')

]

angular.module('OrderMeal:Admin').controller 'AdminFoodController', ['$scope', '$location', 'api', ($scope, $location, api) ->

  $scope.food =
    name: '',
    price: '',
    describe: '',
    picture: ''

  success_handler = ->
    alert('创建成功！')
    $location.url('/all')

  error_handler = ->
    alert("创建菜品失败")
  $scope.create_food = ->
    api.user_create_food $scope.food, success_handler, error_handler

  on_success = (response_data)->
    $('.food-image').attr('src', response_data.url)
    $scope.food.picture = response_data.url

  on_error = (data)->
    alert('图片上传失败')

  on_complete = ->
    console.log "complete"

  before_send = ->

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
      success: on_success,
      error: on_error,
      complete: on_complete,
#      xhr: on_updating_progress,
      beforeSend: before_send
    return
]

angular.module('OrderMeal:Admin').controller 'AdminFoodEditController', ['$scope', '$routeParams', '$location', 'api', ($scope, $routeParams, $location, api) ->
  $scope.food =
    name: '',
    price: '',
    describe: '',
    picture: ''

  $scope.food_id = $routeParams.food_id
  api.user_get_food_by_id $scope.food_id, (data) ->
    $scope.food = data.food

  success_handler = ->
    alert('更新成功')
    $location.url('/all')

  error_handler = ->
    alert('更新失败！！！！')

  $scope.update_food = ->
    api.user_update_food $scope.food_id, $scope.food, success_handler, error_handler

  $scope.cancel = ->
    $location.url('/all')

]