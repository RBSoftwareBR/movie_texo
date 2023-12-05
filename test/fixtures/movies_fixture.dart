const tMoviesJson = '''{
   "content":[
      {
         "id":197,
         "year":2018,
         "title":"Holmes & Watson",
         "studios":[
            "Columbia Pictures"
         ],
         "producers":[
            "Adam McKay",
            "Clayton Townsend",
            "Jimmy Miller",
            "Will Ferrell"
         ],
         "winner":true
      }
   ],
   "pageable":{
      "sort":{
         "unsorted":true,
         "sorted":false,
         "empty":true
      },
      "offset":0,
      "pageSize":2,
      "pageNumber":0,
      "unpaged":false,
      "paged":true
   },
   "last":true,
   "totalPages":1,
   "totalElements":1,
   "size":2,
   "number":0,
   "sort":{
      "unsorted":true,
      "sorted":false,
      "empty":true
   },
   "first":true,
   "numberOfElements":1,
   "empty":false
}''';

const emptyMovieJson = '''{
   "content":[
   ],
   "pageable":{
      "sort":{
         "unsorted":true,
         "sorted":false,
         "empty":true
      },
      "offset":0,
      "pageSize":2,
      "pageNumber":0,
      "unpaged":false,
      "paged":true
   },
   "last":true,
   "totalPages":1,
   "totalElements":1,
   "size":2,
   "number":0,
   "sort":{
      "unsorted":true,
      "sorted":false,
      "empty":true
   },
   "first":true,
   "numberOfElements":1,
   "empty":false
}''';

const invalidMovieJson = '''{
   "content":[
       {
         "id":"Abc"
      }
   ],
   "pageable":{
      "sort":{
         "unsorted":true,
         "sorted":false,
         "empty":true
      },
      "offset":0,
      "pageSize":2,
      "pageNumber":0,
      "unpaged":false,
      "paged":true
   },
   "last":true,
   "totalPages":1,
   "totalElements":1,
   "size":2,
   "number":0,
   "sort":{
      "unsorted":true,
      "sorted":false,
      "empty":true
   },
   "first":true,
   "numberOfElements":1,
   "empty":false
}''';
