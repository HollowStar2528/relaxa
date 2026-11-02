image_speed = 0;
image_index = def_index;
preco = def_preco_habilidade;
//image_alpha = 1;
amostro_preco = function ()
{
    if (global.pause) 
    {
        draw_set_halign(fa_center);
        if (def_habilidade == "mini player") {
        	draw_text(x, y+65,"Vale: " + string(preco+def_preco_mini));
        }
        else {
        	draw_text(x, y+65,"Vale: " + string(preco));
        }
        draw_set_halign(-1);
    }
}

habilidade_vendidas = function()
{
    if (preco <= global.moedas)
    {
        if (def_habilidade == "regeneração" and global.regen == false)
        {
            global.moedas -= preco;
            global.regen = true;
            obj_botao_habilidades.preco += preco;
        }
        if (def_habilidade == "clone" and global.clone == false) {
            global.moedas -= preco;
            global.clone = true;
            obj_botao_habilidades.preco += preco;
        }
        if (def_habilidade == "circulo de energia" and global.circulo == false) {
            global.moedas -= preco;
            global.circulo = true;
            obj_botao_habilidades.preco += preco;
        }
        if (def_habilidade == "tiro teleguiado" and global.tiro_teleguiado == false) {
        	global.moedas -= preco;
            global.tiro_teleguiado = true;
            obj_botao_habilidades.preco += preco;
        }
        if (def_habilidade == "imã" and global.ima == false) {
        	global.moedas -= preco;
            global.ima = true;
            obj_botao_habilidades.preco += preco;
        }
    }
    if (global.moedas >= preco+def_preco_mini)
    {
        if (def_habilidade == "mini player" and global.mini_player == false) {
        	global.moedas -= preco+def_preco_mini;
            global.mini_player = true;
            obj_botao_habilidades.preco += preco;
        }
    }
}