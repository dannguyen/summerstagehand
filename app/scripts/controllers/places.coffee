'use strict'

angular.module('summerstagehandApp')
	.controller 'PlacesCtrl', ["$scope","$rootScope", "$routeParams", "SummerStagePlace", "SummerStagePlaces",   
		($scope, $rootScope, $routeParams, SummerStagePlace, SummerStagePlaces) ->

			


			place_id = $routeParams.placeId
			if place_id?
				$rootScope.noContainer = true 

				$scope.place = SummerStagePlace.get({placeId: $routeParams.placeId}, (data) ->
					$scope.place = data.place
					$scope.dataReady = true
					)

			else
				$rootScope.noContainer = false 
				$scope.places = SummerStagePlaces.get( {}, (data) ->
					$scope.places = data
					$scope.boroughGroups = _.groupBy $scope.places, (p) -> p.borough
					)




	]
       

