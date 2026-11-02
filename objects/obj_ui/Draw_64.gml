draw_set_font(fnt_info);
if (global.pause == false) {
    draw_text(x+5, y+15, "Moedas: " + string(global.moedas));
    draw_text(x+5, y+45, "Pontos requeridos: " + string(global.pontos_requeridos));
    draw_text(x+5, y+60, "Pontos atuais: " + string(global.pontos));
    draw_text(x+5, y+90, "regen: " + string(global.regen));
    draw_text(x+5, y+105, "imã: " + string(global.ima));
    draw_text(x+5, y+120, "clone: " + string(global.clone));
    draw_text(x+5, y+135, "circulo de energia: " + string(global.circulo));
    
    if (instance_exists(obj_player)) {
    	//informações do jogador
        draw_text(x+5, y, "vida: " + string(obj_player.vida));
        draw_text(x+5, y+180, "tempo do regen: " + string(obj_player.tempo_regen));
        draw_text(x+5, y+195, "tempo do imã: " + string(obj_player.tempo_ima));
        draw_text(x+5, y+210, "tempo do circu: " + string(obj_player.tempo_circu));
        draw_text(x+5, y+225, "tempo clone:" + string(obj_player.tempo_clone));
    }
    
    draw_text(x+1255, y+5, "Teclas");
    draw_text(x+1250, y+20, "Loja: Tab");
    draw_text(x+1250, y+35, "Regen: Shift");
    draw_text(x+1250, y+50, "Imã: Alt");
    draw_text(x+1250, y+65, "Circulo: Ctrl");
    draw_text(x+1250, y+80, "Clone: Espaço");
}
draw_set_font(-1);