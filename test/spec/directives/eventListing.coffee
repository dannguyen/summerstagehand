'use strict'

describe 'Directive: eventListing', () ->
  beforeEach module 'yoSummerApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<event-listing></event-listing>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the eventListing directive'
