escolhi = false;
peguei = noone;
indice = 0;
image_speed = 0;
amostra_habilidade = function()
{
    //sabendo que eu escolhi uma habilidade
    if (array_length(global.ativas) == def_habili) {
    	escolhi = true;
        peguei = real(def_habili);
    }
    //se eu não escolhi nenhuma habilidade então eu não apareço
    if (escolhi = false) {
    	image_alpha = 0;
    }
    else {
    	image_alpha = 0.8;
        //minha sprite muda dependendo da minha primeira habilidade ativa
        var _ordem, _habilidade, _qual;
        _habilidade = array_get_index(global.ativas, peguei);
        //descobrindo qual é a habilidade que eu peguei
        _qual = global.ativas[peguei-1];
        repeat (8) {
        	if (_qual == indice) { 
                image_index = _qual; 
            }
            indice+=1;
        }
    }
}

ativa_habilidade = function()
{
    if (global.pc == false) {
        //dizendo qual botão eu apertei dependendo da sprite que eu estou usando
        if (image_index == 0) {
        	obj_player.clone_botao = true;
        }
        if (image_index == 1) {
        	obj_player.circu_botao = true;
        }
        if (image_index == 2) {
        	obj_player.invisivel_botao = true;
        }
        if (image_index == 3) {
        	obj_player.escudo_botao = true;
        }
        if (image_index == 4) {
        	obj_player.portal_botao = true;
        }
        if (image_index == 5) {
        	obj_player.distrair_botao = true;
        }
        if (image_index == 6) {
        	obj_player.paralisa_botao = true;
        }
        if (image_index == 7) {
        	obj_player.mina_botao = true;
        }
    }
}