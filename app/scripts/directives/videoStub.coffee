'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
    	<div class="video">
       <a href="/#/videos/{{video.uid}}"> 
  			<img ng-src="{{video.thumbnail}}" alt="{{video.title}}">
        </a>
    	</div>	
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.css({visibility: 'hidden'})
      _.delay( 
        () ->
          element.css({visibility: 'visible'})
        , _.random(200, 1000);
        )
         
  )
