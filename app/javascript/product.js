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
             });
