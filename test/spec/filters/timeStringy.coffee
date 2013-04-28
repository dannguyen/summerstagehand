'use strict'

describe 'Filter: time strings', () ->

  # load the filter's module
  beforeEach module 'yoSummerApp'

  # initialize a new instance of the filter before each test
  tfit = {}
  beforeEach inject ($filter) ->
    tfit.timeStringy = $filter 'timeStringy'
    tfit.readableDate = $filter 'readableDate'


  it 'should return a properly formatted standard time', () ->
    timeraw = "2013-08-30T01:00:00-04:00"
    timestr = "2013-08-30 01:00"
    expect(tfit.timeStringy timeraw).toBe timestr

  it 'should return a readableDate', () ->


    timeraw = "2013-04-07 12:00"
    timestr = "Sunday, Apr. 7"
    expect(tfit.readableDate timeraw).toBe timestr

    # no dot for June
    timeraw = "2013-06-01 12:00"
    timestr = "Saturday, June 1"
    expect(tfit.readableDate timeraw).toBe timestr
