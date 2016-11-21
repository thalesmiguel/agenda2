$(document).on('turbolinks:load', function() {

  $('#eventos_calendar').fullCalendar({
    locale: 'pt-br',
    timeFormat: "(H[h])(mm[min])",
    events: '/eventos.json',
    titleFormat: "MMMM/YYYY",

    editable: false, // Don't allow editing of events
    handleWindowResize: true,
    displayEventTime: true, // Display event time
    fixedWeekCount: false,
    header: {
      left: 'today, prev next',
      center: 'title',
      right: 'month basicWeek listWeek'},
    views: {
      month: { titleFormat: "MMMM/YYYY" },
      basicWeek: { titleFormat: "DD/MM/YYYY" },
      listWeek: { titleFormat: "DD/MM/YYYY", listDayFormat: "dddd, D/M/Y", listDayAltFormat: false }},
    viewRender: function(view, element) {
      $(".fc-button").addClass("waves-effect");
    },
    eventRender: function(event, element, view) {
      element.attr("data-remote",true);
      element.find("a").attr("data-remote",true);
      if (event.aprovado == true) {element.find(".fc-content").append("<i class='material-icons fc-icon'>check</i>")};

      var eventDate = event.start;
      var calendarDate = $('#eventos_calendar').fullCalendar('getDate');
      if (eventDate.get('month') !== calendarDate.get('month')) {
          return false;
      }
    }
  });

});

// Cidades e Estados
$(function() {
  return $(document).on('change', '#evento_estado', function(evt) {
    return $.ajax('eventos/update_cidades', {
      format: 'js',
      type: 'GET',
      dataType: 'script',
      data: {
        estado_id: $("#evento_estado option:selected").val()
      },
      error: function(jqXHR, textStatus, errorThrown) {
        // return console.log("AJAX Error: " + textStatus);
      },
      success: function(data, textStatus, jqXHR) {
        // return console.log("Dynamic state select OK!");
      }
    });
  });
});
