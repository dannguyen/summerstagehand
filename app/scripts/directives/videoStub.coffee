'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
    	<div class="imgwrap">
			<img ng-src="{{video.youtube_image}}" alt="{{video.name}}">
    	</div>	
      <div class="name">
      	<a href="/#/videos/{{video.id}}">{{video.name}}</a>
      	</div>
      <div class="desc">{{video.description}}</div>
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
         
  )
