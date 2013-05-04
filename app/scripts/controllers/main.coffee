'use strict'

angular.module('summerstagehandApp')
	.controller 'MainCtrl', ($scope) ->

		$scope.events = [
			{name: "Hello world"},
			{name: "Good bye world"}
		]


