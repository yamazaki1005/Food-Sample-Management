$(document).ready(function () {
  var angle = 0;
  var emphasis_count = 1;
  $(".gallery-item1").addClass('addcolor');


  if ($(".carousel").length) {
    var carousel = document.querySelector(".carousel"),
      figure = carousel.querySelector("figure"),
      nav = carousel.querySelector("nav"),
      numImages = figure.childElementCount,
      theta = (2 * Math.PI) / numImages,
      currImage = 0;
    nav.addEventListener("click", onClick, true);
  }

  function onClick(e) {
    e.stopPropagation();
    var t = e.target;
    if (t.tagName.toUpperCase() != "BUTTON") return;
    if (t.classList.contains("next")) {
      currImage++;
      if (emphasis_count == 8) {
        $(`.gallery-item8`).removeClass("addcolor");
        $(`.gallery-item1`).addClass("addcolor");
        emphasis_count = 1;
      } else {
        for (var i = 1; i < 8; i++) {
          if (emphasis_count == i) {
            $(`.gallery-item${i}`).removeClass("addcolor");
            $(`.gallery-item${i + 1}`).addClass("addcolor");
            emphasis_count += 1;
            break;
          }
        }
      }
    } else {
      currImage--;
      if (emphasis_count == 1) {
        $(`.gallery-item1`).removeClass("addcolor");
        $(`.gallery-item8`).addClass("addcolor");
        emphasis_count = 8;
      } else {
        for (var i = 2; i < 9; i++) {
          if (emphasis_count == i) {
            $(`.gallery-item${i}`).removeClass("addcolor");
            $(`.gallery-item${i - 1}`).addClass("addcolor");
            emphasis_count -= 1;
            break;
          }
        }
      }
    }
    figure.style.transform = `rotateY(${currImage * -theta}rad)`;
  }

  $(".carousel figure img").on('click',function(){
    var index = $("img").index(this);
    $(`.gallery-item${index}`).trigger("click");
  });
});
