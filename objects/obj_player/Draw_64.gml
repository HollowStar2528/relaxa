if (global.pause) {
	exit;
}
if (room = rm_gameplay) {
	desenha_vida();
}
if (radar == false) {
	desenha_habilidade();
}
else {
	//efeito de desativado pelo sonar
    draw_set_font(fnt_avisos);
    draw_text_colour(525, 2, "Erro no\nsistema", c_red, c_white, c_red, c_white, 1);
    draw_set_font(-1);
}