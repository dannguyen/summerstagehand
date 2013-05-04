'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerVideo', ($scope, SummerVideo) ->

      $scope.videos = SummerVideo.getVideos()
      console.log "Videos: #{$scope.videos.length}"
   ]
