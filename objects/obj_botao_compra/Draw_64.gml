if (global.loja) {
    draw_set_halign(fa_center);
	draw_text(x, y+65,"Vale: " + string(preco));
    draw_set_halign(-1);
}
pausei();
