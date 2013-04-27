'use strict'

describe 'Controller: EventsCtrl', () ->

  # load the controller's module
  beforeEach module 'yoSummerApp'

  EventsCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    EventsCtrl = $controller 'EventsCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
