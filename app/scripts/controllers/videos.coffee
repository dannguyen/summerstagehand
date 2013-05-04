'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerVideo', '$routeParams', ($scope, SummerVideo, $routeParams) ->

      $scope.videos = SummerVideo.getVideos()
      console.log "Videos: #{$scope.videos.length}"


      if !!$routeParams.videoId
	      $scope.video = SummerVideo.getDetails($routeParams.videoId) 

   ]

