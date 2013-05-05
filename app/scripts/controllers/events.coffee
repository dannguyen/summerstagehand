'use strict'

yoapp = angular.module('summerstagehandApp')

yoapp.controller 'EventsCtrl', ["$scope", "$routeParams", "SummerEvent", "summerStageEvents"  
	($scope, $routeParams, SummerEvent, summerStageEvents) ->

         $scope.dataReady = false


         orderEventsData = (data) ->
            _.sortBy data, (ev) ->
               ev.start_time

         groupEventsData = (data) ->
            _.groupBy data, (ev) ->
               moment(ev.start_time).startOf('week').format "MM/DD"



         $scope.events = summerStageEvents.get( {}, (data) ->
            $scope.events = orderEventsData data
            $scope.groupedEvents = groupEventsData $scope.events
         
         )

         event_id = $routeParams.eventId
         if event_id?
            $scope.event = SummerEvent.get({eventId: event_id}, (edata) ->
               $scope.event = edata.event
               $scope.dataReady = true
            )


]


###
yoapp.controller 'EventDetailCtrl', ["$scope", "$routeParams", "SummerEvent", "summerStageEvents"  
   ($scope, $routeParams, SummerEvent, summerStageEvents) ->

         $scope.dataReady = false

         $scope.places = summerStageEvents.get( {}, (data) ->
            $scope.events = data
         
         )

         
         $scope.event = SummerEvent.get({eventId: $routeParams.eventId}, (data) ->
            $scope.event = data.event
            $scope.dataReady = true
         )

]

###
