#region metodos
vida_ini = def_vida_ini*global.dificuldade;
parado = false;
ia_inimigo = function()
{
    //se o jogador não exite então tudo para de funcionar
    if (!instance_exists(obj_player)) {
    	exit;
    }
    
    var _raio, _raio_movi;
    //definido a minha aréa de ataque 
    _raio = collision_circle(x, y, 150, obj_player, false, true);
    //definindo a minha area de movimento
    _raio_movi = collision_circle(x, y, 100, obj_player, false, true);
    //ao colidir com a teia ele fica preso e incapaz de se mover
    if (place_meeting(x, y, obj_teia)) { 
        speed = 0;
    }
    if (_raio_movi) {
    	//se o jogador entrou no meu raio de alcance eu me explodo
        parado = true;
    }
    //quando não se colide, a velocidade dele volta ao normal
    else {
    	parado = false;
        speed = 2*def_vel_ini;
    }
    //indo na direção do jogador se ele ainda não entrou na minha linha de ataque
    if (parado == false) {
        
        //e se ele estiver visivel
        if (obj_player.usei_invi == false) {
            direcao(global.mira_ini);
        }
    }
    //se o jogador entrar no meu raio de alcance então ele não pode mais usar habilidade
    if (_raio) {
    	obj_player.radar = true;
    }
    //o jogador já pode usar habilidades
    else {
    	obj_player.radar = false;
    }
    //definindo o dano que ele vai causar no jogador
    //funciona da seguinte maneira
    //o dano que ele causa ao jogador é definido pelo dano base do inimigo multiplicado pela dificuldade
    //e subtraido pela defesa do jogador.
    dano = (def_dano_ini*global.dificuldade) - global.defesa;
    //eu atiro se estiver parado e o tempo de tiro estiver zerado
    if (parado) {
        //eu paro de andar
        speed = 0;
    }
    //quando a vida do inimigo chega a zero ou fica menor que zero ele morre
    if (vida_ini <= 0)
    {
    	instance_destroy();
    }
}

#endregion 