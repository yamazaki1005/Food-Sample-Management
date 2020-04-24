$(document).on('turbolinks:load', function () {

  var angle = 0;
  var emphasis_count = 1;
  $(".1").addClass('addcolor');

  $('.left_arrow').click(function galleryspin(sign) {
    if (emphasis_count > 1) {
      emphasis_count -= 1
    } else {
      emphasis_count = 8
    }
    if (emphasis_count == 1) {
      $(".2").removeClass('addcolor');
      $(".1").addClass('addcolor');
    } else if (emphasis_count == 2) {
      $(".3").removeClass('addcolor');
      $(".2").addClass('addcolor');
    } else if (emphasis_count == 3) {
      $(".4").removeClass('addcolor');
      $(".3").addClass('addcolor');
    } else if (emphasis_count == 4) {
      $(".5").removeClass('addcolor');
      $(".4").addClass('addcolor');
    } else if (emphasis_count == 5) {
      $(".6").removeClass('addcolor');
      $(".5").addClass('addcolor');
    } else if (emphasis_count == 6) {
      $(".7").removeClass('addcolor');
      $(".6").addClass('addcolor');
    } else if (emphasis_count == 7) {
      $(".8").removeClass('addcolor');
      $(".7").addClass('addcolor');
    } else if (emphasis_count == 8) {
      $(".1").removeClass('addcolor');
      $(".8").addClass('addcolor');
    }
    spinner = document.querySelector("#spinner");
    angle = angle - 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
  })

  $('.right_arrow').click(function galleryspin(sign) {
    if ( emphasis_count < 8 ){
      emphasis_count += 1
    }else{
      emphasis_count = 1
    }

    if (emphasis_count == 1) {
      $(".8").removeClass('addcolor');
      $(".1").addClass('addcolor');
    } else if (emphasis_count == 2) {
      $(".1").removeClass('addcolor');
      $(".2").addClass('addcolor');
    } else if (emphasis_count == 3) {
      $(".2").removeClass('addcolor');
      $(".3").addClass('addcolor');
    } else if (emphasis_count == 4) {
      $(".3").removeClass('addcolor');
      $(".4").addClass('addcolor');
    } else if (emphasis_count == 5) {
      $(".4").removeClass('addcolor');
      $(".5").addClass('addcolor');
    } else if (emphasis_count == 6) {
      $(".5").removeClass('addcolor');
      $(".6").addClass('addcolor');
    } else if (emphasis_count == 7) {
      $(".6").removeClass('addcolor');
      $(".7").addClass('addcolor');
    } else if (emphasis_count == 8) {
      $(".7").removeClass('addcolor');
      $(".8").addClass('addcolor');
    }

    spinner = document.querySelector("#spinner");
    angle = angle + 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
  })
});
