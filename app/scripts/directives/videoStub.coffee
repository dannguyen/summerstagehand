'use strict';

angular.module('summerstagehandApp')
  .directive('videoStub', () ->
    template: """
    	<div class="video bg">
<div ng-switch="activeVideoId === video.uid" ng-mouseover="makeActive(video)">
       <a href="/#/videos/{{video.uid}}"> 
        <div ng-switch-default>
          <img ng-src="{{video.thumbnail}}" alt=" ">
         </div>

         <div ng-switch-when="true">  
<div class="inset-info">
           <p class="title" style="text-align: center; padding: 5%;">{{video.title}}
            <br> {{video.view_count}} views
            </p>
            </div>
         </div>

        </a>
</div>

    	</div>	
    """
    restrict: 'E'
    link: (scope, element, attrs) ->
      element.css({'visibility': 'hidden'})
#      s = scope.video
#      s.showMe = false
      _.delay( 
        () ->
 #         s.showMe = true
          element.css({'visibility': 'visible'})
 #         console.log "#{s.id}"
        , _.random(100, 1200);
        )
         
  )
