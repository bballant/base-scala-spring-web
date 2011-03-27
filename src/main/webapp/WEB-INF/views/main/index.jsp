<%@ page session="false" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="author" content="bballant" />
    <title>JS Fun</title>
    <script src="/resources/js/protovis-r3.2.js"></script>
    <script src="/resources/js/modernizr-1.7.min.js"></script>
    <style type="text/css">
      body { font-family: Arial; }
      #fig {
        width: 520px;
        height: 520px;
      }
    </style>
  </head>
  <body>
  <div id="container">
    <header>
      <h2>Workout Record</h2>
    </header>
    <div id="fig">
  <script type="text/javascript+protovis">

    //val DAYS_OF_THE_WEEK = "SMTWTFS".split("");
    var DAYS_OF_THE_WEEK = ["S", "M", "T", "W", "T", "F", "S"];
    var MAX_DISTANCE = 13;
    var MAX_LEVEL_OF_EFFORT = 10;

    var scale = 1;
    var h = 20 * scale, ch = 24 * scale, cw = 12 * scale;
    var containerh = 250 * scale, containerw = 150 * scale;

    var march =
      { "monthName": "March", 
        "totalDays": 31,
        "startsOn": 2,
        "exercises": [
        { "day": 1,
          "type": "run",
          "distance": 3,
          "time": 24,
          "levelOfEffort": 8 },
        { "day": 3,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 8 },
        { "day": 8,
          "type": "run",
          "distance": 4,
          "time": 35,
          "levelOfEffort": 8 },
        { "day": 10,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 13,
          "type": "run",
          "distance": 10,
          "time": 85,
          "levelOfEffort": 9 },
        { "day": 15,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 17,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 20,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 22,
          "type": "run",
          "distance": 3.5,
          "time": 35,
          "levelOfEffort": 7 },
        { "day": 24,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 27,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 29,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 31,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 }
        ]
      };

    var april =
      { "monthName": "April", 
        "totalDays": 31,
        "startsOn": 2,
        "exercises": [
        { "day": 1,
          "type": "run",
          "distance": 3,
          "time": 24,
          "levelOfEffort": 8 },
        { "day": 3,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 8 },
        { "day": 8,
          "type": "run",
          "distance": 4,
          "time": 35,
          "levelOfEffort": 8 },
        { "day": 10,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 13,
          "type": "run",
          "distance": 10,
          "time": 85,
          "levelOfEffort": 9 },
        { "day": 15,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 17,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 20,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 22,
          "type": "run",
          "distance": 4,
          "time": 35,
          "levelOfEffort": 7 },
        { "day": 24,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 27,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 29,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 31,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 }
        ]
      };

    var may =
      { "monthName": "May", 
        "totalDays": 31,
        "startsOn": 2,
        "exercises": [
        { "day": 1,
          "type": "run",
          "distance": 3,
          "time": 24,
          "levelOfEffort": 8 },
        { "day": 3,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 8 },
        { "day": 8,
          "type": "run",
          "distance": 4,
          "time": 35,
          "levelOfEffort": 8 },
        { "day": 10,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 13,
          "type": "run",
          "distance": 10,
          "time": 85,
          "levelOfEffort": 9 },
        { "day": 15,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 17,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 20,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 22,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 24,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 },
        { "day": 27,
          "type": "run",
          "distance": 11,
          "time": 90,
          "levelOfEffort": 9 },
        { "day": 29,
          "type": "training",
          "distance": 11,
          "time": 20,
          "levelOfEffort": 3 },
        { "day": 31,
          "type": "training",
          "distance": 0,
          "time": 60,
          "levelOfEffort": 10 }
        ]
      };

    var exerciseLog = [ march, april, may ];

    function range(len) {
      var l = [];
      for (var i = 0; i < len; i++) {
        l = l.concat(i); 
      } 
      return l;
    }

    function monthByWeek(month) {
      var numberOfWeeks = (month.startsOn + month.totalDays) / 7;
      var wklist = [];
      var curr = 0;
      for (var week in range(numberOfWeeks)) {
        var dylist = [];
        for (var dayOfWeek in range(7)) {
          var exercise = { "day": -1, "dayOfWeek": dayOfWeek, 
            "type": "", "distance": 0, "time": 0, "levelOfEffort": 0};
          if (curr < month.exercises.length) {
            var currexercise = month.exercises[curr];
            var calculated = (month.startsOn + currexercise.day - 1) % 7;
            if (dayOfWeek == calculated) {
              exercise = currexercise;
              curr = curr + 1; 
            }
          }
          dylist[dayOfWeek] = exercise
        }
        wklist[week] = dylist;
      }
      return wklist;
    }

    function effortPct(exercise) {
      if (exercise.type == "run") return exercise.distance / MAX_DISTANCE;
      else return exercise.levelOfEffort / MAX_LEVEL_OF_EFFORT;
    }

    function colorForExercise(exercise) {
      if (exercise.type == "run") return "#33cccc";
      else return "#FF7400";    
    }

    function drawMonthData(month) {
       var vis = new pv.Panel()
         .width(containerw)
         .height(containerh);

      vis.add(pv.Label)
        .text(month.monthName)
        .font("bold "+(cw + (cw/6))+"px Arial")
        .textAlign("left")
        .left(0)
        .top(ch);
      
      vis.add(pv.Label)
        .data(DAYS_OF_THE_WEEK)
        .font("bold "+(cw + (cw/10))+"px Arial")
        .textAlign("center")
        .left(function() cw * (this.index + .5))
        .top(ch + ch);

      vis.add(pv.Panel)
        .data(monthByWeek(month))
        .top(function() ch + (ch * (this.index + 1)))
        .height(h)
        .add(pv.Bar)
          .data(function(a) {return a;})
          .left(function() .5 + (cw * this.index))
          .bottom(0)
          .width(cw - .5)
          .height(function(d) d ? (effortPct(d) * h) : 0)
          .strokeStyle("#000")
          .lineWidth(.5)
          .antialias(false)
          .fillStyle(function(d) d ? colorForExercise(d) : "#FFF");

       vis.render();
     }

    $(document).ready(function(){
      $.each(exerciseLog, function(index, month) { drawMonthData(month); });
    });
  </script>
    
    </div>
    <footer>
    </footer>
  </div>
  <script src="/resources/js/jquery-1.5.1.min.js"></script>
  </body>
</html>
