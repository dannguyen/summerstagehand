'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideos', 'SummerEvent', '$routeParams', ($scope, SummerStageVideos, SummerEvent, $routeParams) ->

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         console.log($scope.videos.length)

         if !!$routeParams.videoId
            $scope.video = _.find $scope.videos, (vid) -> vid.uid == $routeParams.videoId
            $scope.event = SummerEvent.get({eventId: $scope.video.event_id}, (data) ->
               $scope.event = data.event
               $scope.dataReady = true
               )

  

#      $scope.showExtraNav = true


   ]

