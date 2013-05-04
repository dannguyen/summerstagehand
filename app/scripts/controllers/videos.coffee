'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideo', '$routeParams', ($scope, SummerStageVideo, $routeParams) ->

      $scope.videos = SummerStageVideo.getVideos()
      console.log "Videos: #{$scope.videos.length}"


      if !!$routeParams.videoId
	      $scope.video = SummerStageVideo.getDetails($routeParams.videoId) 

   ]

