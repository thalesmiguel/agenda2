$.fullCalendar.locale("pt-br", {
	buttonText: {
		month: "Mês",
		week: "Semana",
		day: "Dia",
		list: "lista",
		today: "hoje"
	},
	allDayText: "dia inteiro",
	eventLimitText: function(n) {
		return "mais +" + n;
	},
	noEventsMessage: "Não há eventos para mostrar",
	monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho','Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
	monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
	dayNames: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'],
	dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab']
});
