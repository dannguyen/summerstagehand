'use strict'

yoapp = angular.module('yoSummerApp')

yoapp.controller 'EventsCtrl', ["$scope", "$location",
   	($scope, $location) ->
#  			$scope.event = event


  ]



yoapp.controller 'EventDetailCtrl', ["$scope", "$routeParams", "SummerEvent", 
   ($scope, $routeParams, SummerEvent) -> 
      resp = SummerEvent.get( 
         {eventId: $routeParams.eventId},
            (d) ->
               $scope.event = d.event ## brittle
      )

      


]


