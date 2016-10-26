$(document).on('turbolinks:load', function() {

  $('#eventos_calendar').fullCalendar({
    locale: 'pt-br',
    timeFormat: "H[h](mm[min])",
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
    eventRender: function(event, element, view) {
      element.attr("data-remote",true);
      // console.log(event)
      if (event.aprovado == true) {element.find(".fc-content").append("<i class='material-icons fc-icon'>check</i>")};

      $(".fc-button").addClass("waves-effect");

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
