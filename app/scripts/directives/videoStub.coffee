'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
      <div class="name"><strong><a href="/#/videos/{{video.id}}">{{video.name}}</a></strong></div>
      <div class="desc">{{video.description}}</div>
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
         
  )
