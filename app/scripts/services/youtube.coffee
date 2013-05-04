'use strict'

angular.module('summerstagehandApp')
  .service 'youtubeVid', ['$http', ($http) ->
      apiBaseUrl = "https://gdata.youtube.com/feeds/api/"
      apiVersion = 2
      apiVStr = "v=#{apiVersion}"
      apiFStr = "alt=json"

      this.videoUrl = (v_id) ->
          apiBaseUrl + "videos/#{v_id}?#{apiVStr}&#{apiFStr}"
    
      this.fetchVideoData = (v_id, foo_success) ->
          $http.get(this.videoUrl(v_id)).
            success (data) ->
                foo_success(data)
          
  ]
  
