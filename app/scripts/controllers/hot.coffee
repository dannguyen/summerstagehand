'use strict'

angular.module('yoSummerApp')
  .controller 'HotCtrl', ($scope, $http) ->
	$scope.awesomeThings = [
	  'HTML5 Boilerplate',
	  'AngularJS',
	  'Karma'
	]

	$scope.sss = "hey"


#	$scope.todos = $http.get( '/data/sample/sample.json')
#	.then (res) ->
#		$scope.todos = res.data

