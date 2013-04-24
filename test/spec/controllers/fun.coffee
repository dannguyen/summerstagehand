'use strict'

describe 'Controller: FunCtrl', () ->

  # load the controller's module
  beforeEach module 'yoSummerApp'

  FunCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    FunCtrl = $controller 'FunCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
