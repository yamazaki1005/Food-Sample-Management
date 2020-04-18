$(document).on('turbolinks:load', function () {

  var angle = 0;
  $('.left_arrow').click(function galleryspin(sign) {
    spinner = document.querySelector("#spinner");
    angle = angle - 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
  })

  $('.right_arrow').click(function galleryspin(sign) {
    spinner = document.querySelector("#spinner");
    angle = angle + 45
    spinner.setAttribute("style", "-webkit-transform: rotateY(" + angle + "deg); -moz-transform: rotateY(" + angle + "deg); transform: rotateY(" + angle + "deg);");
  })
});
