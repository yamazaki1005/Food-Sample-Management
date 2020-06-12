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



  $('select[name="cooking[product_category_id]"]').change(function () {
    var product_classification = $(this).val();
    console.log("食材分類のIDは" + product_classification + "です。");

     function buildHTML(data) {
       var html = `
                  h1 ${data[0]}
                `;
       return html;
     }

    $.ajax({
      type: 'GET',
      url: '/cookings/foodstuff',
      data: {
        product_category_id: product_classification
      },
      dataType: 'json'
    })
      .done(function (data) {
        console.log("成功♪");
        console.log(data);
        var html = buildHTML(data);
        $("#form_check_box_list").append(html);
      })
      .fail(function () {
        console.log("失敗");
      });
  });

  // チェックを入れた内容を一覧表示
  let product_check = [];
  $('input:checkbox[name="cooking[product_ids][]"]').click(function () {
    var arr_text = $(this).parent('label').text();
    if (product_check.some(num => num === arr_text ) ) {
      // 配列から削除
      var idx = $.inArray(arr_text, product_check);
      if (idx >= 0) {
        product_check.splice(idx, 1);
      }
    } else {
      // 配列に追加
      product_check.push(arr_text);
      product_check.filter(function (x, i, self) {
        return self.indexOf(x) === i;
      });
    }
    $('#span').text(product_check);
    console.log(product_check);
  });
});
