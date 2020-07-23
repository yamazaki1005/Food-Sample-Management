$(document).on("turbolinks:load", function () {
  var pagetop = $("#page-top");
  var navbar = $("#scroll-nav");

  pagetop.hide();
  navbar.hide();

  pagetop.click(function () {
    $("body,html").animate(
      {
        scrollTop: 0,
      },
      500
    );
    return false;
  });

  $(window).scroll(function () {
    if ($(this).scrollTop() <= 115) {
      navbar.hide();
    } else if ($(this).scrollTop() <= 1000) {
      navbar.show();
      pagetop.fadeOut();
    } else {
      pagetop.fadeIn();
    }
  });
});

$(document).ready(function () {
  $(window).scroll(function () {
    $(".fadein").each(function () {
      var elemPos = $(this).offset().top;
      var scroll = $(window).scrollTop();
      var windowHeight = $(window).height();
      if (scroll > elemPos - windowHeight + 200) {
        $(this).addClass("scrollin");
      }
    });
  });

  setInterval(function () {
    var $active = $('#slideshow img.active');

    if ($active.length == 0) $active = $('#slideshow img:last');

    var $next = $active.next().length ? $active.next()
      : $('#slideshow img:first');

    $active.addClass('last-active');

    $next.css({ opacity: 0.0 })
      .addClass('active')
      .animate({ opacity: 1.0 }, 3000, function () {
        $active.removeClass('active last-active');
      });
    }, 4000);

  $('a[href^="#"]').click(function () {
    var time = 500;
    var href = $(this).attr("href");
    var target = $(href == "#" ? "html" : href);
    var distance = target.offset().top;
    $("html, body").animate({ scrollTop: distance }, time, "swing");
    return false;
  });
});
