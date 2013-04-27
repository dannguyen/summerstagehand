'use strict'

describe 'Filter: timeStringy', () ->

  # load the filter's module
  beforeEach module 'yoSummerApp'

  # initialize a new instance of the filter before each test
  timeStringy = {}
  beforeEach inject ($filter) ->
    timeStringy = $filter 'timeStringy'

  it 'should return a properly formatted standard time', () ->
    timeraw = "2013-08-30T01:00:00-04:00"
    timestr = "2013-08-30 01:00"

    expect(timeStringy timeraw).toBe timestr
