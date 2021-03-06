<html>
  <head>
    <title>Bootstrap Rating Input Demo</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <!-- <script src="src/bootstrap-rating-input.js"></script> -->
    <script src="build/bootstrap-rating-input.min.js"></script>
    <style>
      body {
        font-size: 20px;
        padding: 50px;
      }

      .myclass {
        color: red;
        font-size: 12px;
      }

    </style>
    <script>
      $(function(){
        $('input').on('change', function(){
          alert("Changed: " + $(this).val())
        });
      });
    </script>
  </head>
  <body>
    <h1>The Original Bootstrap Rating Input <small>in action...</small></h1>

    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating1" class="rating" data-clearable="remove"/></p>

    <h2>Using a default value:</h2>
    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating-default" class="rating" data-clearable="remove" value="5"/></p>

    <h2>With an empty clear button</h2>
    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating-empty-clearable" class="rating" data-clearable/></p>

    <h2>With an clear button that is always visible</h2>
    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating-empty-clearable" class="rating" data-clearable data-clearable-remain="true"/></p>

    <h2>With a minimum value and a special empty-value:</h2>
    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating-minimum" class="rating" data-clearable="remove" data-min="2" data-empty-value="1"/></p>


    <h1>Extra options <small>introduced by <a href="https://github.com/iyedb">iyedb</a></h1>
    <h2>Inline:</h2>
    <p>Inline rating: <input type="number" name="your_awesome_parameter" id="rating-inline" class="rating" data-clearable="remove" data-inline/></p>
    <h2>Read only:</h2>
    <p>Readonly: <input type="number" name="your_awesome_parameter" id="rating-readonly" class="rating" data-clearable="remove" value="2" data-readonly/></p>

    <h1>The Bootstrap Rating input with custom icon classes <small>by <a href="https://github.com/johncadigan">johncadigan</a></small></h1>
    <p>My rating: <input type="number" name="your_awesome_parameter" id="rating-custom-icons" class="rating" data-clearable="remove" data-icon-lib="fa" data-active-icon="fa-heart" data-inactive-icon="fa-heart-o" data-clearable-icon="fa-trash-o" value="4"/></p>
  </body>
</html>
