//= require jquery
//= require jquery_ujs
//= require_tree .


$(document).ready(function() {




  $(document).on("ready", function () {
    var promiseOfResult = $.getJSON("/quizzes");

    var format_answer_item = function (answer) {
      var answer_item_var =
        "<li>" + answer["answer_item"] + "</li>";

      return answer_item_var;

    };

    var whatToDoWhenItSucceeds = function (jsonResponse) {
      var todo_items_var = jsonResponse.map(format_answer_item );

      $('.js-output ul').html(todo_items_var);
    };

    promiseOfResult.success(whatToDoWhenItSucceeds);

  });




  $('form').on('submit', function(e) {
    e.preventDefault();
    var answer =$('#first-answer').val();


    $.ajax({
      type: "POST",
      url: "/quizzes",
      data: {
       answer_item: answer
      }
    });



    console.log(answer);

    $('#answer-form').append("<div class='pop'>"+ answer +'</div>');



  });


});