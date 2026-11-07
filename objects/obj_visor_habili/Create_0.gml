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
    	image_alpha = 0.5;
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