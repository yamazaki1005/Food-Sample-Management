// carousel-slider(bxslider)
jQuery(document).on("turbolinks:load", function() {
  $(".bxslider").bxSlider({});
});

// submit自動送信
jQuery(document).bind("ready ajaxComplete", function() {
  $(".select-drop").change(function() {
    $(this)
      .parent()
      .submit();
  });
});
