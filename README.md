## jquery-selecting -- a jquery plugin for chained selecting, coded by CoffeeScript 
### Usages:
```JavaScrit
$('selector').selecting({
  remote: {
    url: 'json_array_url',
    data: {}
  }
});
```
### JSON Array format:
```JSON
[ [ ["Select[name]", "option"]
    ,["univ", "university"]
    ,["campus", "campus"]
    ,["dorm", "dormitory"]
  ]
  ,[["USTC", "University of Science and Technology of China"]
    ,[["west", "west campus"]
      ,[["x007", "Student Dormitory No.7"]
      ]
      ,[["x008", "Student Dormitory No.8"]
      ]
    ]
    ,[["east", "east campus"]
    ]
    ,[["north", "north campus"]
    ]
    ,[["south", "south campus"]
    ]
  ]
  ,[["HFUT", "HeiFei University of Technology"]
  ]
  ,[["AHU", "AnHui University"]
  ]
]
``` 
