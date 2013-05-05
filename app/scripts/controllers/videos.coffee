'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideo', '$routeParams', ($scope, SummerStageVideo, $routeParams) ->

      $scope.videos = SummerStageVideo.getVideos()
      $scope.showExtraNav = true

      if !!$routeParams.videoId
	      $scope.video = SummerStageVideo.getDetails($routeParams.videoId) 

   ]

