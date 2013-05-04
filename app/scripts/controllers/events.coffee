'use strict'

yoapp = angular.module('summerstagehandApp')

yoapp.controller 'EventDetailCtrl', ["$scope", "$routeParams", "SummerEvent", 
	($scope, $routeParams, SummerEvent) ->

		$scope.event = {description: 'xxx'}
		resp = SummerEvent.get( 
		   {eventId: $routeParams.eventId},
		      (d) ->
		         $scope.event = d.event ## brittle
		)

]


