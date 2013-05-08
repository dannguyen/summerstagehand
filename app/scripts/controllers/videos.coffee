'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideos', '$window', 'SummerEvent', '$routeParams', '$rootScope', ($scope, SummerStageVideos, $window, SummerEvent, $routeParams, $rootScope) ->

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $scope.categories = _.uniq(_.pluck( $scope.videos, 'category'))

         $scope.makeActive = (vid) ->
            $scope.activeVideoId = vid.uid

         $rootScope.noContainer = true 
         $scope.videoDataLoaded = true

         if $routeParams.sortType == 'view_count' 
            $scope.sortType = 'view_count'
            $scope.videos = _.sortBy $scope.videos, (v) -> -v.view_count
         else
            $scope.sortType = 'event_date'
            $scope.videos = _.sortBy $scope.videos, (v) -> v.event_date

         console.log($scope.sortType)
         $scope.theCategory = ''

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



