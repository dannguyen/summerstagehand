'use strict';

angular.module('yoSummerApp')
	.filter 'timeStringy', () ->
   	(input) ->
      	moment(input).format("YYYY-MM-DD HH:mm")

   # input is array, [date1, date2]
	.filter 'dateRange', () ->
		(date_arr) ->
			moment(date_arr[0]).format("MM-DD") + " to " + moment(date_arr[1]).format("MM-DD")

	.filter 'timeRange', () ->
		(date_arr) ->
			moment(date_arr[0]).format("h a") + " to " + moment(date_arr[1]).format("h a")

