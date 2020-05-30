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

  var pagetop = $('#page_top');
  pagetop.hide();
  $(window).scroll(function () {
    if ($(this).scrollTop() > 800) {
      pagetop.fadeIn();
    } else {
      pagetop.fadeOut();
    }
  });
  pagetop.click(function () {
    $('body,html').animate({
      scrollTop: 0
    }, 500);
    return false;
  });

});
