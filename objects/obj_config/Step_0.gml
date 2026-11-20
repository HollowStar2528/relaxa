if (global.pause) {
    //o cursor aparece quando o jogo for pausado por qualquer motivo
    window_set_cursor(cr_default);
	exit;
}
//o cursor não aparece normalmente
window_set_cursor(cr_none);
config_xp();
ativa_debug();
//vendo algumas informações
show_debug_message(global.nivel);
show_debug_message(global.quant_habili);