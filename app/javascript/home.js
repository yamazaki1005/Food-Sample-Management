$(document).on('turbolinks:load', function () {
  var pagetop2 = $('#scroll-nav');
  pagetop2.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 115) {
      pagetop2.show();
    } else {
      pagetop2.hide();
    }
  });

  var pagetop = $('#page-top');
  pagetop.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 1000) {
      pagetop.fadeIn();
    } else {
      pagetop.fadeOut();
    }
  });
});

$(document).ready(function () {
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

  pagetop.click(function () {
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;
  });

  $('a[href^="#"]').click(function () {
    var time = 500;
    var href = $(this).attr("href");
    var target = $(href == "#" ? 'html' : href);
    var distance = target.offset().top;
    $("html, body").animate({ scrollTop: distance }, time, "swing");
    return false;
  });
});
