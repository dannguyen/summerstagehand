'use strict';

angular.module('summerstagehandApp')

	.filter 'convertParagraphs', () ->
		(txt) ->
			# converts new lines into paragraph wraps

			return "" unless txt?

			arr = _.map (txt.split("\n")), (p) -> 
				"<p>#{p}</p>"
			console.log(arr.join("xx"))
			arr.join("")

	.filter 'youtubeSrc', () ->
		(vid) ->
			# converts to youtube video with unique vid identifier
			"http://www.youtube.com/embed/#{vid}?rel=0&theme=light&autoplay=0"


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
				m.format "MMM. D, dddd"	
			else
				m.format "MMMM D, dddd"

	.filter 'scheduledTimeMinimal', () ->
		(date_arr) ->
			## assumes that days are the same
			m1 = moment(date_arr[0])
			m2 = moment(date_arr[1])

			# 11:20am-5:30pm
			full_time_str = m1.format('h:mma') + "-" + m2.format('h:mma')

			# if same AM/PM, then take out first reference
			if m1.format('a') == m2.format('a')
				full_time_str = full_time_str.replace(/\w{2}(?=-)/,'')

			# remove zero minutes
			full_time_str = full_time_str.replace(/:00/g, '')

	# do both readable and scheduled
	.filter 'standardTimeMinimal', ($filter) ->
		(date_arr) ->
			day = $filter('readableDate')(date_arr[0])
			range = $filter('scheduledTimeMinimal')(date_arr)

			"#{day} #{range}"

