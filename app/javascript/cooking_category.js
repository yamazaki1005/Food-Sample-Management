$(document).on('turbolinks:load', function () {

  var angle = 0;
  var emphasis_count = 1;
  $(".gallery-item1").addClass('addcolor');

  $('.left_arrow').click(function galleryspin(sign) {
    spinner = document.querySelector("#spinner");
    angle = angle - 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
    for (var i = 2; i < 9; i++) {
      if (emphasis_count == i) {
        $(`.gallery-item${i}`).removeClass('addcolor');
        $(`.gallery-item${i - 1}`).addClass('addcolor');
        emphasis_count -= 1
        exit
      }
    }
    $(`.gallery-item1`).removeClass('addcolor');
    $(`.gallery-item8`).addClass('addcolor');
    emphasis_count = 8
  })

  $('.right_arrow').click(function galleryspin(sign) {
    spinner = document.querySelector("#spinner");
    angle = angle + 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
    for (var i = 1; i < 8; i++) {
      if (emphasis_count == i) {
        $(`.gallery-item${i}`).removeClass('addcolor');
        $(`.gallery-item${i + 1}`).addClass('addcolor');
        emphasis_count += 1
        exit
      }
    }
    $(`.gallery-item8`).removeClass('addcolor');
    $(`.gallery-item1`).addClass('addcolor');
    emphasis_count = 1
  })
});
