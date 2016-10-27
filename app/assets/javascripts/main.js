// $(document).on('turbolinks:load', function() {
//
//   $('button').removeClass("fc-state-hover fc-prev-button fc-state-default fc-corner-left fc-corner-right");
//
//   $(document).on("mouseover", "button", function(){
//     $('button').removeClass("fc-state-hover fc-prev-button fc-state-default fc-corner-left fc-corner-right");
//   });
//
//   setTimeout(function(){
//     $(".fc-row.fc-week.fc-widget-content").removeAttr("style").attr("style", "min-height:10em");
//     $(".fc-scroller.fc-day-grid-container").attr("style", "height:100%");
//   }, 100);
//
// });

$(document).on('turbolinks:load', function(){
  $('.modal-trigger').leanModal();
  $('select').material_select();
  $(".button-collapse").sideNav();
  $("select[required]").css({display: "block", height: 0, padding: 0, width: 0, position: 'absolute'});

  // Mouse Trap
  Mousetrap.bind(['command+p', 'ctrl+p'], function(e) {
    $('a[data-target="impressao_modal"]').click();
    return false;
  });
});

$(function() {
    $.rails.allowAction = function(link) {
        if (!link.attr('data-confirm')) {
            return true;
        }
        $.rails.showConfirmDialog(link);
        return false;
    };

    $.rails.confirmed = function(link) {
        link.removeAttr('data-confirm');
        return link.trigger('click.rails');
    };

    $.rails.showConfirmDialog = function(link) {
        var html, message;
        message = link.attr('data-confirm');
        html = "<div id=\"modal1\" class=\"modal\" style=\"z-index: 1003; width: 30%; display: block; opacity: 1; transform: scaleX(1); top: 10%;\"> <div class=\"modal-content\"><h4>Atenção</h4><p>" + message + "</p></div><div class=\"modal-footer\"><a class=\"modal-action modal-close waves-effect waves-green btn-flat close\">Cancelar</a><a class=\"modal-action modal-close waves-effect waves-red btn-flat confirm\">Confirmar</a></div></div>";
        $('body').append(html);
        $('#modal1').openModal({
            complete: function() {
                $('#modal1').remove();
            }
        });
        return $('#modal1 .confirm').on('click', function() {
            return $.rails.confirmed(link);
        });
        return $('#modal1 .close').on('click', function() {
            return $('#modal1').closeModal();
        });
    };
});
