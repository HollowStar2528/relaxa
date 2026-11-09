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
    speed = 5;
    //se eu me colidi com o jogador eu me destruo e causo dano
    //mas se eu me colidi com o escudo então eu apenas me destruo
    var _colidi, _escudo; 
    _colidi = place_meeting(x, y, obj_player);
    _escudo = instance_exists(obj_escudo);
    if (_colidi) {
        //se o escudo não existe então eu causo o efeito
        if (!_escudo) {
            //desnorteando o jogador
            global.desnorteado = true;
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