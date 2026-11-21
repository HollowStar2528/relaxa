//variavel para saber qual é a minha variavel
habilidade = def_habilidade;
amostra = false;
image_speed = 0;
//função para saber qual habilidade eu devo desenhar
desenha_recarga = function()
{
    var _habili = real(habilidade);
    image_index = _habili;
    if (_habili == 0 and obj_player.recarga_clone) {
    	id.amostra = true;
    }
    else if (_habili == 1 and obj_player.recarga_circulo) {
    	amostra = true;
    }
    else if (_habili == 2 and obj_player.recarga_invisivel) {
    	id.amostra = true;
    }
    else if (_habili == 3 and obj_player.recarga_escudo) {
    	id.amostra = true;
    }
    else if (_habili == 4 and obj_player.recarga_portal) {
    	id.amostra = true;
    }
    else if (_habili == 5 and obj_player.recarga_distrair) {
    	id.amostra = true;
    }
    else if (_habili == 6 and obj_player.recarga_paralisa) {
    	id.amostra = true;
    }
    else if (_habili == 7 and obj_player.recarga_mina) {
    	id.amostra = true;
    }
    else {
    	id.amostra = false;
    }
    if (id.amostra) {
    	draw_self();
        image_alpha = 0.8;
    }
}