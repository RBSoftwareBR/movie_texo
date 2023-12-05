const tProducersJson = """{
   "min":[
      {
         "producer":"Joel Silver",
         "interval":1,
         "previousWin":1990,
         "followingWin":1991
      }
   ],
   "max":[
      {
         "producer":"Matthew Vaughn",
         "interval":13,
         "previousWin":2002,
         "followingWin":2015
      }
   ]
}""";

const emptyProducersJson = '''{
   "min":[
   ],
   "max":[
   ]
}''';

const invalidYearsJson = '''{
   "min":[
      {
         "abd":12341,
      }
   ],
   "max":[
        {
         "abdad":12341,
      }
   ]
}''';
