$(document).on('turbolinks:load', function () {

  $(".imgArea img").click(function () {
    $("#graydisplay").html($(this).prop("outerHTML"));
    $("#graydisplay").fadeIn(200);
  });

  $("#graydisplay, #graydisplay img").click(function () {
    $("#graydisplay").fadeOut(200);
  });

  $("#MyCookingModal").on("shown.bs.modal", function (event) {
    var button = $(event.relatedTarget);
    var name = button.data("name");
    var id = button.data("id");
    var url = button.data("url");
    var modal = $(this);
    modal.find(".modal-body").text(name + "を削除します。");
    modal.find("form").attr("action", url);
  });
});
