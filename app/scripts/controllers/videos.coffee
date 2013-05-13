'use strict'

angular.module('summerstagehandApp')
   .controller 'VideosCtrl', ['$scope', 'SummerStageVideos', '$window', 'SummerEvent', '$routeParams', '$rootScope', ($scope, SummerStageVideos, $window, SummerEvent, $routeParams, $rootScope) ->

      $scope.videos = SummerStageVideos.get {}, (data) -> 
         $scope.videos = data
         $scope.categories = ( _.uniq(_.flatten(_.pluck( $scope.videos, 'category_list')))).sort()


         $scope.otherEventVideos = []
         $scope.relatedVideos = []

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
         
         
         $scope.theCategory = ''

         if $window.innerWidth < 500
         else if $window.innerWidth < 780
            $scope.ramaSize = 'small'
         else
            $scope.ramaSize = 'large'

         if !!$routeParams.videoId
            $rootScope.noContainer = false 
            $scope.video = the_video = _.find $scope.videos, (vid) -> vid.uid == $routeParams.videoId

            $scope.event = SummerEvent.get({eventId: $scope.video.event_id}, (ed) ->
               $scope.event = ed.event
               $scope.eventDataReady = true  

               $scope.otherEventVideos = _.select $scope.videos, (evid) -> 
                  evid.uid != the_video.uid && evid.event_id == the_video.event_id

               $scope.relatedVideos = _.select $scope.videos, (evid) ->
                  evid.uid != the_video.uid && evid.category.match the_video.category && evid.event_id != the_video.event_id


               )


         $scope.dataReady = true
  

         
]




