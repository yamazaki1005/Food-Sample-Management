$(document).on('turbolinks:load', function() {

  $("#myModal").on("shown.bs.modal", function(event) {
    var button = $(event.relatedTarget);
    var name = button.data("name");
    var number = button.data("number");
    var id = button.data("id");
    var url = button.data("url");
    var modal = $(this);
    modal.find(".modal-body").text("品番:" + number + " " + name + "を削除します。");
    modal.find("form").attr("action", url);
  });

  $('#img_field').click(function () {
    $("#file").click();
  })

  $('#reset').click(function () {
    $preview = $("#img_field");
    $preview.empty();
  })

  $('#box-1').click(function () {
    $("#form").toggleClass("bg-dark");
    $("#form").toggleClass("bg-white");
    $("#form").toggleClass("discontinued");
  })

  $fileField = $('#file')

  $($fileField).on('change', $fileField, function (e) {
    file = e.target.files[0]
    reader = new FileReader(),
    $preview = $("#img_field");
    reader.onload = (function (file) {
      return function (e) {
        $preview.empty();
        $preview.append($('<img>').attr({
          src: e.target.result,
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
