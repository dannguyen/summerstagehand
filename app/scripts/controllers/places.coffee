'use strict'

angular.module('summerstagehandApp')
	.controller 'PlacesCtrl', ["$scope", "$routeParams", "SummerStagePlace", "SummerStagePlaces",   
		($scope, $routeParams, SummerStagePlace, SummerStagePlaces) ->

			$scope.places = SummerStagePlaces.get( {}, (data) ->
				$scope.places = data
				$scope.boroughGroups = _.groupBy $scope.places, (p) -> p.borough
				console.log ($scope.groupedPlaces)
				)


			place_id = $routeParams.placeId

			if place_id?
				$scope.place = SummerStagePlace.get({placeId: $routeParams.placeId}, (data) ->
					$scope.place = data.place
					$scope.dataReady = true
					)

	]
       

