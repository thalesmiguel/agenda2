$("#evento_cidade_id").empty().append("<%= escape_javascript(render 'cidades', cidades: @cidades) %>");
$('select').material_select();
