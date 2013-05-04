'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
      <div class="name"><strong>{{video.name}}</strong></div>
      <div class="desc">{{video.description}}</div>
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
         
  )
