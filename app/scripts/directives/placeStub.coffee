'use strict';

angular.module('summerstagehandApp')
   .directive('placeStub', () ->
#      templateUrl: 'views/place-stub.html'
      template: "<em>x{{placeName}}x -- {{ev.name}}</em>"
      restrict: 'E'
      scope:
         placeName: '@placeName'
         placeId: '@placeId'
         ev: '@ev'
      link: (scope, element, attrs) ->
         element.addClass('active')
#         element.text "this is the placeStub directive: #{attrs.val}"
     #    scope.$apply(attrs.val)

)
