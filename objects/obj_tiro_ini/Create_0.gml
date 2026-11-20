//ao ser criado eu vou na direção do jogador
direcao(global.mira_ini);
//metodo de ataque do tiro
controla_bala = function()
{
    //se o jogador não existe então nada roda
    if (!instance_exists(obj_player)) {
    	exit;
    }
    //definido a velocidade da bala
    speed = 4;
    //se eu me colidi com o jogador eu me destruo e causo dano
    //mas se eu me colidi com o escudo então eu apenas me destruo
    var _colidi, _dano, _escudo; 
    _colidi = place_meeting(x, y, obj_player);
    _escudo = instance_exists(obj_escudo);
    if (_colidi) {
        //se o escudo não existe então eu causo dano
        if (!_escudo) {
            //definindo o meu dano
            _dano = (1*global.dificuldade)-global.defesa;
            //causando dano no jogador se o meu dano for maior que zero
            if (_dano > 0) {
            	obj_player.vida-=_dano;
                obj_player.recebi_dano = true;
            }
        	//me destruindo
            instance_destroy();
        }
        //se o escudo existe então eu não causo dano
        else {
        	instance_destroy();
        }
    }
    //se eu sair da tela então eu me destruo
    if (x<-64 or x > 14080 or y <-64 or y > 800) {
    	instance_destroy();
    }
}

//olhando para a direção correta
olhando = function()
{
    //Olhando para o inimigo mais proximo se ele existir
    if (instance_exists(global.mira_ini)) {
        var _y, _x, _olha;
        _x = instance_nearest(x,y, global.mira_ini).x;
        _y = instance_nearest(x, y, global.mira_ini).y;
        _olha = lerp(image_angle, point_direction(x, y, _x, _y), 0.05);
        image_angle = _olha;
    }
}
