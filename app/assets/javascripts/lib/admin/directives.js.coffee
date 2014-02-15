angular.module('OrderMeal:Admin').directive 'omShowButton', [ ->
  restrict: 'A'
  link: (scope, element, attributes) ->
    element.hover () ->
      element.find('.edit').fadeIn()
      element.find('.delete').fadeIn()
    ,() ->
      element.find('.edit').fadeOut()
      element.find('.delete').fadeOut()
]
angular.module('OrderMeal:Admin').directive 'omImageCrop', [ ->
  restrict: 'A'
  link: (scope, element, attributes) ->
    element.load () ->
      if element.width() > element.height()
        element.css('height', '100%')
        gap = (element.parent().width() - element.width())/2
        element.css("margin-left", gap)
      else
        element.css('width', '100%')
        gap = (element.parent().height() - element.height())/2
        element.css("margin-top", gap)

]