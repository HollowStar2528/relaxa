#region metodos
vida_ini = def_vida_ini*obj_gerador.dificuldade;
dar_moedas = false;
tempo = 40;
colidi = false;
ia_inimigo = function()
{
    //se o jogador não exite então tudo para de funcionar
    if (!instance_exists(obj_player)) {
    	exit;
    }
    if (place_meeting(x, y, obj_teia)) { 
        speed = 0;
    }
    else {
    	speed = 3*def_vel_ini;
    }
    //indo na direção do meu inimigo
    if (obj_player.usei_invi == false) {
        direcao(global.mira_ini);
    }
    dano = (def_dano_ini*global.dano*obj_gerador.dificuldade) - global.defesa;
    if (vida_ini <= 0)
    {
    	instance_destroy();
    }
}

#endregion 