'use strict';

angular.module('summerstagehandApp')

	.filter 'convertParagraphs', () ->
		(txt) ->
			# converts new lines into paragraph wraps

			return "" unless txt?

			arr = _.map (txt.split("\n")), (p) -> 
				"<p>#{p}</p>"
			arr.join("")

	.filter 'shortenString', () ->
		(str) ->
			str.substring(0,45) + "..."

	.filter 'youtubeSrc', () ->
		(vid) ->
			# converts to youtube video with unique vid identifier
			"http://www.youtube.com/embed/#{vid}?rel=0&theme=light&autoplay=0"

	.filter 'googleMaps', () ->
		(coords) ->
			"https://maps.google.com/maps?q=#{coords[0]},#{coords[1]}&hl=en&z=14"

	.filter 'googleStaticMap', () ->
		(opts) ->
			z = opts.z || 13
			markers_str = _.map(opts.markers , (m) -> ("#{m.lat},#{m.lng}")).join('|')
			"http://maps.googleapis.com/maps/api/staticmap?&markers=label:O|#{markers_str}&sensor=false&hl=en&zoom=#{z}&size=#{opts.w}x#{opts.h}"


	.filter 'foursquareVenue', () ->
		(fsq_id) ->
			"https://foursquare.com/v/#{fsq_id}"

	.filter 'timeStringy', () ->
   	(input) ->
      	moment(input).format("YYYY-MM-DD HH:mm")

	.filter 'shortDate', () ->
   	(input) ->
      	moment(input).format("M/D")

   # input is array, [date1, date2]
	.filter 'dateRange', () ->
		(date_arr) ->
			moment(date_arr[0]).format("MM-DD") + " to " + moment(date_arr[1]).format("MM-DD")

	.filter 'plus6days', () -> # dont use
		(monday) ->
			day1 = moment(monday)
			day2 = moment(day1).add('days', 6)

			if day1.month() == day2.month()
				"#{day1.format("MMMM D")} to #{day2.format("D")}"
			else
				"#{day1.format("MMMM D")} to #{day2.format("MMMM D")}"



	.filter 'weekDisplay', () -> # dont use
		(first_day) ->
			day1 = moment(first_day)
			if day1.day() == 0
				day1.subtract('weeks', 1).add('days', 1) # go back one week since we want to group sun with sat
			else 
				day1.startOf('week').add('days', 1)

	#		day2 = day1.add('days', 6)
			# terrible TK
			"#{day1.format("MM DD")} to #{day1.add('days', 6).format("MM DD")}"

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

	.filter 'fullDate', () ->
		(datestr) ->
			m = moment(datestr)
			m.format "dddd, MMMM D, YYYY"


	.filter 'scheduledTimeMinimal', () ->
		(date_arr) ->
			## assumes that days are the same
			m1 = moment(date_arr[0])
			m2 = moment(date_arr[1])

			# 11:20am-5:30pm
			full_time_str = m1.format('h:mm a') + " - " + m2.format('h:mm a')

			# if same AM/PM, then take out first reference
			if m1.format('a') == m2.format('a')
				full_time_str = full_time_str.replace(/\w{2}(?= -)/,'')

			# remove zero minutes
			full_time_str = full_time_str.replace(/:00/g, '')

	# do both readable and scheduled
	.filter 'standardTimeMinimal', ($filter) ->
		(date_arr) ->
			day = $filter('readableDate')(date_arr[0])
			range = $filter('scheduledTimeMinimal')(date_arr)

			"#{day}, #{range}"

