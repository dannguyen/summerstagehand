'use strict'

yoapp = angular.module('summerstagehandApp')

yoapp.controller 'EventDetailCtrl', ["$scope", "$routeParams", "SummerEvent",  
	($scope, $routeParams, SummerEvent) ->

         $scope.dataReady = false
         
         $scope.event = SummerEvent.get({eventId: $routeParams.eventId}, (data) ->
            
            $scope.event = data.event
            $scope.dataReady = true
         )

]


