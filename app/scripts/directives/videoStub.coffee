'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
    	<div class="video bg" ng-mouseover="makeActive(video)" ng-switch="activeVideoId === video.uid">
       <a href="/#/videos/{{video.uid}}"> 
        <div ng-switch-default>
    			<img ng-src="{{video.thumbnail}}" alt=" ">
         </div>

         <div ng-switch-when="true">  
           <p class="title" style="text-align: center; padding: 10%;">{{video.title}}</p>
         </div>

        </a>
    	</div>	
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.css({visibility: 'hidden'})
      _.delay( 
        () ->
          element.css({visibility: 'visible'})
        , _.random(100, 1000);
        )
         
  )
