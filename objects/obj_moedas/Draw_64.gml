draw_set_font(fnt_menu);
draw_set_halign(fa_center);
if (global.pause) {
	draw_text(x, y, "Moedas: " + string(global.moedas));
}
draw_set_halign(-1);
draw_set_font(-1);