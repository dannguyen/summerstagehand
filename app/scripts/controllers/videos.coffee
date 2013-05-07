'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideos', 'SummerEvent', '$routeParams', '$rootScope', ($scope, SummerStageVideos, SummerEvent, $routeParams, $rootScope) ->

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $rootScope.noContainer = true 

         if !!$routeParams.videoId
            $rootScope.noContainer = false 
            $scope.video = _.find $scope.videos, (vid) -> vid.uid == $routeParams.videoId
            $scope.event = SummerEvent.get({eventId: $scope.video.event_id}, (data) ->
               $scope.event = data.event
               
               )

         $scope.dataReady = true
  

#      $scope.showExtraNav = true


   ]

