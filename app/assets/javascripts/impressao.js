//= require jquery
//= require moment
//= require fullcalendar
//= require fullcalendar/pt-br


$(document).on('ready', function() {

  var eventos = $.parseJSON($("#json").text());
  console.log(eventos);
  var calendarios = $("#eventos_impressao_calendar[data-mes]");

  calendarios.each(function(index){
    var ano = $(this).data('ano');
    var mes = $(this).data('mes');
    var calendario = $(this);
    calendario.fullCalendar({
      locale: 'pt-br',
      timeFormat: "(H[h])(mm[min])",
      events: eventos,
      titleFormat: "MMMM/YYYY",
      displayEventTime: true, // Display event time
      eventRender: function(event, element, view) {
        if (event.aprovado == true) {element.find(".fc-content").append("<i class='material-icons fc-icon'>check</i>")};
        var eventDate = event.start;
        var calendarDate = calendario.fullCalendar('getDate');
        if ((eventDate.get('month') !== calendarDate.get('month')) || (eventDate.get('year') !== calendarDate.get('year'))) {
            return false;
        }
      },
      eventAfterAllRender: function(view){
        $("#eventos_impressao_calendar[data-mes='" + mes + "'][data-ano='" + ano + "']").fullCalendar('gotoDate', new Date(ano, mes-1));
      }
    });
  });

  window.status = "pronto"
});


// $(document).on('ready', function(e) {
//
//   var evento;
//   $.ajax({
//     // url: "/eventos.json",
//     url: "/json",
//
//     cache: false,
//     type: 'GET',
//     dataType: 'json',
//     success: function(result){
//       evento = result;
//       console.log(evento);
//       $('#eventos_impressao_calendar').fullCalendar({
//         locale: 'pt-br',
//         timeFormat: "H[h](mm[min])",
//         events: evento,
//         titleFormat: "MMMM/YYYY",
//         displayEventTime: true, // Display event time
//         eventRender: function(event, element) {
//           if (event.aprovado == true) {element.find(".fc-content").append("<i class='material-icons fc-icon'>check</i>")};
//         }
//       });
//     },
//     error: function (xhr, ajaxOptions, thrownError) {
//       console.log(xhr.status);
//       console.log(thrownError);
//       $("#bozo").append("<h1> thrownError </h1>")
//       $("#bozo").append(thrownError)
//       $("#bozo").append("<h1> xhr.status </h1>")
//       $("#bozo").append(xhr.status)
//       $("#bozo").append("<h1> Ruby </h1>")
//       $("#bozo").append("<%= Rails.root %>")
//       e.preventDefault();
//       window.status = "pronto";
//     }
//   });
//
// });
