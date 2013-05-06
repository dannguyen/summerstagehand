# NOT USED 
yoapp = angular.module('summerstagehandApp')

yoapp.factory 'mapService', ['', () ->

  {

    # el_id has been set in $scope.map_el_id 
    # map options is in $scope.mapOptions
    buildMap: () ->
    
      el_id = $scope.map_el_id 
      opts = $scope.mapOptions
    
      mapopts = {}
      mapopts.zoom = opts.zoom || 12
      mapopts.center = new google.maps.LatLng(-34.397, 150.644)
      mapopts.mapTypeId = google.maps.MapTypeId.ROADMAP

      map = new google.maps.Map(document.getElementById(el_id), mapopts);
      true 

  }

]



