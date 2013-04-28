'use strict';

angular.module('yoSummerApp')
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
	   	console.log "RESET!!"
	   	self.activeFilters = {}

	   @isActiveInFilterSet = (f_name, f_type) ->
	   	return _.include self.activeFilters[f_type], f_name

	   @isPartOfActive = (item) ->

	   	# quick check to see if any filters have been set
	   	return true if !self.hasAnyFiltersSet() 

	   	return false for f_type, f_vals of self.activeFilters when( 
	   	# if not included in every filter, then return false
	   		!!!item[f_type] || (!_.isEmpty(f_vals) && !_.include( f_vals, item[f_type] ))  
	   	)

	   	# otherwise, if no early break, then all conditions are good
	   	return true 


	   @facetPluck = (arr, propName, goFoo) ->

	   	if !goFoo?
		   	collection = _.pluck(arr, propName)
		   ## return groupBy
		   else
		   	collection = [] 
		   	_.each(arr, (item) ->
		   		v = goFoo(item)
		   		collection.push v 
		   		item[propName] = v
		   	)

		   self.filterSets[propName] = _.uniq(collection)


