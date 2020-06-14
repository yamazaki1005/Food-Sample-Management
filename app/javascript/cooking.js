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
    var product_classification = $(this).val(); /*食材分類ID取得*/
    $.ajax({
      type: 'GET',
      url: '/cookings/foodstuff',
      data: {
        product_category_id: product_classification
      },
      dataType: 'json'
    })
      .done(function (data) {
        for ( let t = 1; t < 29; t++) {
          if ( product_classification == t ) {
            $(`#form_check_box_list${product_classification}`).show(); /* ドロップダウンリストから選択された食材IDに該当するチェックボックスを表示 */
          } else {
            $(`#form_check_box_list${t}`).hide(); /* それ以外は非表示*/
          }
        }
        if ($(`#form_check_box_list${product_classification}`).find("label").length == 0) { /* チェックボックスの生成。初めて表示するときだけ適用する */
          for (let i = 0; i < data.length; i++) {
            let addedElem = `<label for="cooking_product_ids_${data[i]["id"]}"><input type="checkbox" value="${data[i]["id"]}" name="cooking[product_ids][]" id="cooking_product_ids_${data[i]["id"]}" class="checkbox-input"><span class="checkbox-parts">${data[i]["product_name"]}</span></input></label>`;
            $(`#form_check_box_list${product_classification}`).append(addedElem); /* 該当のIDをもつdivに定義したhtmlを適用させる */
          }
        }
      })
      .fail(function () {
        console.log("失敗");
      });
  });

  // チェックを入れた内容を一覧表示
  let product_check = [];
  $(document).on("change", '[name="cooking[product_ids][]"]', function () {
    var arr_text = $(this).parent("label").text();
    console.log(arr_text);

    if (product_check.some((num) => num === arr_text)) {
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
    $("#span").text(product_check);
  });
});
