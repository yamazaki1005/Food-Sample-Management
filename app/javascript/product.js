$(function() {
              // 文字色を赤に変える: javascriptが効いているかどうかの確認用
               $(".card-text").css("color", "red");

               // $("myModal").on("show.bs.modal", function (event) {
               //   var button = $(event.relatedTarget);
               //   var name = button.data("name");
               //   var number = button.data("number");
               //   var id = button.data("id");
               //   var url = button.data('url');
               //   var modal = $(this);
               //   // modal.find(".modal-title").val(namedata);
               //   // modal.find(".modal-title").val("New message to " + namedate);
               //   modal.find(".modal-body").text("品番:" + numberdata + " 品名:" + namedata + " を削除します。" + "IDは" + iddata + "です。")

               //   modal.find('form').attr('action', url);
               // });

               // show.bs.modal：モーダルが開く直前に発生するイベント
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
             });
