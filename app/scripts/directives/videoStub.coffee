'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
    	<div class="imgwrap">
       <a href="/#/videos/{{video.uid}}"> 
  			<img ng-src="{{video.thumbnail}}" alt="{{video.title}}">
        </a>
    	</div>	


      <div class="video-info" ng-hide="true">
          <div class="title">
          	<a href="/#/videos/{{video.uid}}">{{video.title}}</a>
          	</div>
          <div class="desc">{{video.description}}</div>
        </div>
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
         
  )
