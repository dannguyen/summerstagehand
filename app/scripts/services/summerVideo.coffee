'use strict';

angular.module('yoSummerApp')
  .factory 'SummerVideo', () ->
    # Service logic
    # ...

    meaningOfLife = 42
    videoData = [
      {
         name: "A Video",
         youtube_id: "QJ4tyowlVUM",
         description: "Lorem ipsum lasdf <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptas, veniam, numquam asperiores eaque ipsum vero illum libero molestiae inventore temporibus repellat nam! Pariatur, eveniet, quia deserunt officiis delectus quo adipisci!</div>
            Dicta, sequi, accusantium, quis, provident molestiae dolores voluptates debitis distinctio deleniti voluptas esse repellendus sint dolor ut itaque repudiandae quisquam corrupti delectus assumenda velit optio ducimus vero quidem facilis nam? "
      }

    ]

    # Public API here
    {
     

      # returns video data from my own service
      getDetails: (vid) ->
         # stub
         vid_data = videoData[0]
         vid_data.id = vid  
         vid_data # return this

    }
