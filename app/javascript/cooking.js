$(document).on('turbolinks:load', function () {

  $(".imgArea img").click(function () {
    $("#graydisplay").html($(this).prop("outerHTML"));
    $("#graydisplay").fadeIn(200);
  });

  $("#graydisplay, #graydisplay img").click(function () {
    $("#graydisplay").fadeOut(200);
  });

  $("#MyCookingModal").on("shown.bs.modal", function (event) {
    let button = $(event.relatedTarget);
    let name = button.data("name");
    let id = button.data("id");
    let url = button.data("url");
    let modal = $(this);
    modal.find(".modal-body").text(name + "を削除します。");
    modal.find("form").attr("action", url);
  });

  $("#select_pro_category").change(function () {
    let productClassification = $(this).val(); /*食材分類ID取得*/
    $.ajax({
      type: "GET",
      url: "/cookings/foodstuff",
      data: {
        product_category_id: productClassification,
      },
      dataType: "json",
    })
      .done(function (data) {
        for (let t = 1; t < 29; t++) {
          if (productClassification == t) {
            $(
              `#form_check_box_list${productClassification}`
            ).show(); /* ドロップダウンリストから選択された食材IDに該当するチェックボックスを表示 */
          } else {
            $(`#form_check_box_list${t}`).hide(); /* それ以外は非表示*/
          }
        }
        if (
          $(`#form_check_box_list${productClassification}`).find("label")
            .length == 0
        ) {
          /* チェックボックスの生成。初めて表示するときだけ適用する */
          for (let i = 0; i < data.length; i++) {
            let addedElem = `<label for="cooking_product_ids_${data[i]["id"]}"><input type="checkbox" value="${data[i]["id"]}" name="cooking[product_ids][]" id="cooking_product_ids_${data[i]["id"]}" class="checkbox-input"><span class="checkbox-parts">${data[i]["product_name"]}</span></input></label>`;
            $(`#form_check_box_list${productClassification}`).append(
              addedElem
            ); /* 該当のIDをもつdivに定義したhtmlを適用させる */
          }
        }
      })
      .fail(function () {
        console.log("失敗");
      });
  });

  // チェックを入れた内容を一覧表示
  let productCheck = [];
  $(document).on("change", ".checkbox-input", function () {
    let arrText = $(this).parent("label").text();
    console.log(arrText);
    if (productCheck.some((num) => num === arrText)) {
      // 配列から削除
      let idx = $.inArray(arrText, productCheck);
      if (idx >= 0) {
        productCheck.splice(idx, 1);
      }
    } else {
      // 配列に追加
      productCheck.push(arrText);
      productCheck.filter(function (x, i, self) {
        return self.indexOf(x) === i;
      });
    }
    $("#span").text(productCheck);
  });
});
