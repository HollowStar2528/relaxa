#region metodos
vida_ini = def_vida_ini*global.dificuldade;
//tempo = 40;
ia_inimigo = function()
{
    //se o jogador não exite então tudo para de funcionar
    if (!instance_exists(obj_player)) {
    	exit;
    }
    //ao colidir com a teia ele fica preso e incapaz de se mover
    if (place_meeting(x, y, obj_teia)) { 
        speed = 0;
    }
    //quando não se colide, a velocidade dele volta ao normal
    else {
    	speed = 3*def_vel_ini;
    }
    //indo na direção do jogador
    if (obj_player.usei_invi == false) {
        direcao(global.mira_ini);
    }
    //definindo o dano que ele vai causar no jogador
    //funciona da seguinte maneira
    //o dano que ele causa ao jogador é definido pelo dano base do inimigo multiplicado pela dificuldade
    //e subtraido pela defesa do jogador.
    dano = (def_dano_ini*global.dificuldade) - global.defesa;
    //quando a vida do inimigo chega a zero ou fica menor que zero ele morre
    if (vida_ini <= 0)
    {
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

#endregion 