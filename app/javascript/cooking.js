$(document).on('turbolinks:load', function () {

  $("#MyCookingModal").on("shown.bs.modal", function (event) {
    var button = $(event.relatedTarget);
    var name = button.data("name");
    var id = button.data("id");
    var url = button.data("url");
    var modal = $(this);
    modal.find(".modal-body").text(name + "を削除します。");
    modal.find("form").attr("action", url);
  });

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
