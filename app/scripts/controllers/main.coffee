'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ['$scope', 'summerStageEvents', 'SummerStageVideos', '$timeout', ($scope, summerStageEvents, SummerStageVideos, $timeout) ->

		$scope.events = summerStageEvents.get( {}, (data) ->
         $scope.events = data[0..10]         
      )

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $scope.videoDataLoaded = true

         $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]
         console.log($scope.randomVideo)

         $scope.randomizeVideos()

      $scope.randomizeVideos = () ->
         $timeout( () ->
            $scope.randomVideo = $scope.videos[_.random($scope.videos.length)]
            $scope.randomizeVideos()
         , 1000
         )


]
