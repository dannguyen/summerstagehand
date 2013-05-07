'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideos', '$window', 'SummerEvent', '$routeParams', '$rootScope', ($scope, SummerStageVideos, $window, SummerEvent, $routeParams, $rootScope) ->

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $rootScope.noContainer = true 
         $scope.videoDataLoaded = true

         if $window.innerWidth < 500
         else if $window.innerWidth < 780
            $scope.ramaSize = 'small'
         else
            $scope.ramaSize = 'large'

         if !!$routeParams.videoId
            $rootScope.noContainer = false 
            $scope.video = _.find $scope.videos, (vid) -> vid.uid == $routeParams.videoId
            $scope.event = SummerEvent.get({eventId: $scope.video.event_id}, (data) ->
               $scope.event = data.event
               
               )

         $scope.dataReady = true
  

         
]

#      $scope.showExtraNav = true



