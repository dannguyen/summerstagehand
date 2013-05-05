'use strict'

describe 'Controller: PlacesCtrl', () ->

  # load the controller's module
  beforeEach module 'summerstagehandApp'

  PlacesCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PlacesCtrl = $controller 'PlacesCtrl', {
      $scope: scope
    }

