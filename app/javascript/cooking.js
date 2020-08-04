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

  if ($("#form_check_box_list1").length) {
    function change_checkbox(_this) {
      let productClassification = $(_this).val(); /*食材分類ID取得*/
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
              var prop = $(`#cooking_product_ids_${data[i]["id"]}`).prop('checked');
              // 参照用チェックボックスの値に応じてチェックボックスを生成する
              if (prop) {
                let addedElem = `<label for="cooking_product_ids_${data[i]["id"]}"><input type="checkbox" value="${data[i]["id"]}" name="cooking[product_ids][]" id="cooking_product_ids_${data[i]["id"]}" class="checkbox-input" checked="checked"><span class="checkbox-parts">${data[i]["product_name"]}</span></input></label>`;
                $(`#form_check_box_list${productClassification}`).append(addedElem);
              } else {
                let addedElem = `<label for="cooking_product_ids_${data[i]["id"]}"><input type="checkbox" value="${data[i]["id"]}" name="cooking[product_ids][]" id="cooking_product_ids_${data[i]["id"]}" class="checkbox-input"><span class="checkbox-parts">${data[i]["product_name"]}</span></input></label>`;
                $(`#form_check_box_list${productClassification}`).append(addedElem);
              }
            }
          }
        })
        .fail(function () {
          console.log("失敗");
        });
    };
    // チェックボックス生成イベントをページ読み込み時とドロップダウン変更時に発火させる
    $(document).ready(function () {
      change_checkbox("#select_pro_category");
      // 読み込み時チェックの入っているものを配列に追加する
      $('input[name="cooking[product_ids][]"]:checked').each(function () {
        productCheck.push($(this).next("label").text());
      });
      $("#span").text(productCheck);
    });
    $("#select_pro_category").change(function () {
      change_checkbox(this);
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

    $(document).on("click", "#reset", function () {
      productCheck = [];
      $("#span").text(productCheck);
    });
  }

  $(function() {
    $('.directUpload').find("input:file").each(function (i, elem) {
      var fileInput = $(elem);
      var form = $(fileInput.parents('form:first'));
      var submitButton = form.find('input[type="submit"]');
      var progressBar = $("<div class='bar'></div>");
      var barContainer = $("<div class='progress'></div>").append(progressBar);
      fileInput.after(barContainer);
      fileInput.fileupload({
        fileInput: fileInput,
        url: form.data('url'),
        type: 'POST',
        autoUpload: true,
        formData: form.data('form-data'),
        paramName: 'file', // S3 does not like nested name fields i.e. name="user[avatar_url]"
        dataType: 'XML',  // S3 returns XML if success_action_status is set to 201
        replaceFileInput: false,
        progressall: function (e, data) {
          var progress = parseInt(data.loaded / data.total * 100, 10);
          progressBar.css('width', progress + '%')
        },
        start: function (e) {
          submitButton.prop('disabled', true);

          progressBar.
            css('background', 'green').
            css('display', 'block').
            css('width', '0%').
            text("Loading...");
        },
        done: function (e, data) {
          submitButton.prop('disabled', false);
          progressBar.text("Uploading done");

          // extract key and generate URL from response
          var key = $(data.jqXHR.responseXML).find("Key").text();
          var url = '//' + form.data('host') + '/' + key;

          // create hidden field
          var input = $("<input />", { type: 'hidden', name: fileInput.attr('name'), value: url })
          form.append(input);
        },
        fail: function (e, data) {
          submitButton.prop('disabled', false);

          progressBar.
            css("background", "red").
            text("Failed");
        }
      });
    });
  });
});
