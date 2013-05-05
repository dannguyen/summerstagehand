'use strict';

angular.module('summerstagehandApp')
	.service 'filterService', () ->
	 # Service logic
	 # ...


	 # Public API here

		
	   @activeFilters = {}
	   @filterSets = {}
	   self = this 

	   # modifies @activeFilters, does not change anything
	   @set_filter = (f_name, f_type) ->
	   	_arr_af = @activeFilters[f_type] ?= []

	   	idx = _.indexOf(_arr_af, f_name)
	   	if idx > -1 #
	   		# already present, remove it
	   		_arr_af.splice(idx, 1)
	   	else
		   	## add it in
	   		_arr_af.push f_name

	   # returns true if hash is empty or contains just empty arrays
	   @hasAnyFiltersSet = () ->
	   	return true for f_type, f_vals of self.activeFilters when !_.isEmpty(f_vals)
	   	return false

	   @resetAll = () ->
	   	# just blank out activeFilters
	   	self.activeFilters = {}

	   @isActiveInFilterSet = (f_name, f_type) ->
	   	return _.include self.activeFilters[f_type], f_name

	   @isPartOfActive = (item) ->

	   	# quick check to see if any filters have been set
	   	return true if !self.hasAnyFiltersSet() 


	   	for f_type, f_vals of self.activeFilters

	   		if !_.isEmpty(f_vals)
	   			item_value = item[f_type]

	   			return false if !item_value

	   			if !_.isArray item_value
	   				return false if !_.include f_vals, item_value
	   			else
	   				return false if _.isEmpty(_.intersection( f_vals, item_value))


	   	return true 


	   # modifies @filterSets
	   @facetPluck = (arr, propName, goFoo) ->

	   	if !goFoo?
		   	collection = _.map arr, (x) ->
		   		x[propName]

		   	collection = _.flatten collection


		  		 ## return groupBy
		   else
		   	collection = [] 
		   	_.each(arr, (item) ->
		   		v = goFoo(item)
		   		collection.push v 
		   		item[propName] = v
		   	)

		   self.filterSets[propName] = _.uniq(collection)


