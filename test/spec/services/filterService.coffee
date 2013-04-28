'use strict'

describe 'Service: filterService', () ->

	# load the service's module
	beforeEach module 'yoSummerApp'

	# instantiate service
	filterService = {}
	beforeEach inject (_filterService_) ->
		filterService = _filterService_



	it "should set_filter", () ->
		af = filterService.activeFilters 

		filterService.set_filter('Apple', 'Fruits')
		expect(af.Fruits[0]).toBe 'Apple'

		filterService.set_filter('Orange', 'Fruits')
		filterService.set_filter('Apple', 'Fruits')
		# remove Apple
		expect(af.Fruits[0]).toNotBe 'Apple'

	it "Should initially be empty", () ->
		expect(filterService.hasAnyFiltersSet()).toBe false

	it "should not be empty when something is added", () ->
		filterService.set_filter('Orange', 'Fruits')
		expect(filterService.hasAnyFiltersSet()).toBe true

		## and then empty again
		filterService.set_filter('Orange', 'Fruits')
		expect(filterService.hasAnyFiltersSet()).toBe false

	it "should @isPartOfActive should evaluate to true at beginning", () ->
		expect(filterService.isPartOfActive({})).toBe true

	it "should @isPartOfActive should evaluate to false when something set", () ->
		filterService.set_filter('Orange', 'Fruits')
		expect(filterService.isPartOfActive({})).toBe false

		expect(filterService.isPartOfActive({Fruits: 'Orange'})).toBe true
		expect(filterService.isPartOfActive({Fruits: 'Apple'})).toBe false

	it "should @isPartOfActive should AND across different active filter sets", () ->

		filterService.set_filter('Orange', 'Fruits')
		filterService.set_filter('Good', 'Quality')

		expect(filterService.isPartOfActive({Fruits: 'Orange'})).toBe false
		expect(filterService.isPartOfActive({Fruits: 'Orange', Quality: 'Poor'})).toBe false
		expect(filterService.isPartOfActive({Fruits: 'Orange', Quality: 'Good'})).toBe true
	it "should reset filters", () ->
		filterService.set_filter('Orange', 'Fruits')
		filterService.resetAll()
		expect(filterService.hasAnyFiltersSet()).toBe false


	it 'should facetPluck with just prop name', () ->
		arr = [
			{name: 'dan'},
			{name: 'bob'},
			{name: 'mary'}
		]

		filterService.facetPluck(arr, 'name')
		expect(filterService.filterSets['name'].length).toBe 3


	it "should facetPluck with foo given", () ->
		arr = [
			{name: 'danso'},
			{name: 'bob'},
			{name: 'mary'}
		]

		filterService.facetPluck(arr, 'name_length', (i) ->(i.name.length))
		expect(filterService.filterSets['name_length'].sort().join(',')).toBe "3,4,5"

		# should also modify array
		expect( arr[0].name_length ).toBe 5
