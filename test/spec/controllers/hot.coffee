'use strict'

describe 'Controller: HotCtrl', () ->

  # load the controller's module
  beforeEach module 'yoSummerApp'

  HotCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    HotCtrl = $controller 'HotCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
