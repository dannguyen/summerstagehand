'use strict';

angular.module('summerstagehandApp')

	.filter 'filterParagraphs', () ->
		(txt) ->
			# converts new lines into paragraph wraps
			arr = _.map (txt.split("\n")), (p) -> 
				"<p>#{p}</p>"
			arr.join("")

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

	.filter 'readableDate', () ->
		(datestr) ->
			m = moment(datestr)
			if m.format('MMMM').length > 4
				m.format "dddd, MMM. D"	
			else
				m.format "dddd, MMMM D"

	.filter 'timeRangeMin', () ->
		(date_arr) ->
			## assumes that days are the same
			m1 = moment(date_arr[0])
			m2 = moment(date_arr[1])

			full_time_str = "h_1 a_1 to "

			# if same time half, then don't repeat AM, PM
		#	todo

			# if no minutes, then omit minutes
		#	todo



			

			# if diff day, then don't don't have AM PM
			# if diff timespan (am/pm), then 
			m1.format("h a") + " to " + m2.format("h a")

