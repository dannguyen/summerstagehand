'use strict'

yoapp = angular.module('yoSummerApp')

yoapp.controller 'EventsCtrl', ["$scope", "$location",
   	($scope, $location) ->
#  			$scope.event = event


  ]



yoapp.controller 'EventDetailCtrl', ["$scope", "$routeParams", "SummerEvent", 
		($scope, $routeParams, SummerEvent) -> 
			$scope.event = SummerEvent.get( 
				{eventId: $routeParams.eventId},
				(event) ->
					console.log event.name ## debugging 
			)
]


