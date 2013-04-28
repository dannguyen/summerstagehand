'use strict';

## not working
angular.module('yoSummerApp')
  .directive('eventListing', () ->
    template: '<div></div>'
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.text 'this is the eventListing directive'
  )
