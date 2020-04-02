$(document).on('turbolinks:load', function () {

  $(".time-limit").fadeOut(4000);

  // // 文字色を赤に変える: javascriptが効いているかどうかの確認用
  // $(".card-text").css("color", "red");
  // $(".form-group").css("color", "red");
  $('.box_container').hover(function () { //box_containerにマウスを乗せた時
    var width = $(this).outerWidth() / 2; //box_containerの幅を取って半分にします
    $(this).find('.left').animate(  //class="left"にアニメーションを与えます
      { right: width }, //上記で取ってきた半分のwidth分ずらします
      { queue: false, duration: 2000 });
    $(this).find('.right').animate( //上記の右側の処理です。
      { left: width },
      { queue: false, duration: 2000 });
  }, function () {  //マウスアウトの処理でオン時にずらした分を戻します
    $(this).find('.left').animate({ right: 0 }, { queue: false, duration: 800 });
    $(this).find('.right').animate({ left: 0 }, { queue: false, duration: 800 });
  });
});
