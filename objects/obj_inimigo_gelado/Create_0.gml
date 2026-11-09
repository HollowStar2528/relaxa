#region metodos
vida_ini = def_vida_ini*global.dificuldade;
tempo = 35;
//se eu me explodi então não darei pontos para o jogador
explodi = false;
//fico parado
parado = false;
ia_inimigo = function()
{
    //se o jogador não exite então tudo para de funcionar
    if (!instance_exists(obj_player)) {
    	exit;
    }
    //definido a minha aréa de ataque
    var _raio = collision_circle(x, y, 90, obj_player, false, true);
    //ao colidir com a teia ele fica preso e incapaz de se mover
    if (place_meeting(x, y, obj_teia)) { 
        speed = 0;
    }
    if (_raio) {
    	//se o jogador entrou no meu raio de alcance eu me explodo
        parado = true;
    }
    //quando não se colide, a velocidade dele volta ao normal
    else {
    	speed = 3*def_vel_ini;
    }
    //indo na direção do jogador se ele ainda não entrou na minha linha de ataque
    if (parado == false) {
        //e se ele estiver visivel
        if (obj_player.usei_invi == false) {
            direcao(global.mira_ini);
        }
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
    	//o tempo passa ao ficar parado
        tempo--;
        //quando ele zera eu explodo me destruindo
        if (tempo <= 0) {
        	//explodindo
            var _bomba = instance_create_layer(x, y, layer,obj_gelo);
            _bomba.area = 3.2;
            //me destruindo
            explodi = true;
            instance_destroy();
        }
    }
    //quando a vida do inimigo chega a zero ou fica menor que zero ele morre
    if (vida_ini <= 0)
    {
    	instance_destroy();
    }
}

#endregion 