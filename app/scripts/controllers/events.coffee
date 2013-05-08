'use strict'

yoapp = angular.module('summerstagehandApp')

yoapp.controller 'EventsCtrl', ["$scope", "$routeParams", "SummerEvent", "summerStageEvents", "SummerStagePlace", "$rootScope", 
	($scope, $routeParams, SummerEvent, summerStageEvents, SummerStagePlace, $rootScope) ->

         $scope.eventsDataReady = false
         $rootScope.noContainer = false 

#         $scope.filterService = { activeFilters: {} }
         $scope.theCategory = ""

         orderEventsData = (data) ->
            _.sortBy data, (ev) ->
               ev.start_time

         groupEventsData = (data) ->
            _.groupBy data, (ev) ->
               moment(ev.start_time).subtract('days', 1).startOf('week').add('days', 1).format "YYYY-MM-DD"



         loadPlace = (p_id) ->
            $scope.placeDataReady = false
            return unless p_id?

            $scope.place = SummerStagePlace.get({placeId: p_id}, (data) ->
               $scope.place = s_place = data.place
               $scope.placeDataReady = true


               $scope.otherPlaceEvents = _.select s_place.events, (pev) -> 
                  pev.id != $scope.event.id


               $scope.otherPlaceEvents = $scope.otherPlaceEvents[0..5]

               )


         

         event_id = $routeParams.eventId
         if event_id?
            $scope.event = SummerEvent.get({eventId: event_id}, (edata) ->
               $scope.event = edata.event
               $scope.dataReady = true
               loadPlace($scope.event.place_id)
            )
         else
            $scope.events = summerStageEvents.get( {}, (data) ->
               $scope.eventsDataReady = true


               $scope.events = orderEventsData data
               $scope.categories = _.uniq(_.pluck( $scope.events, 'canonical_category'))
               console.log $scope.categories 

               $scope.groupedEvents = groupEventsData $scope.events
           
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
