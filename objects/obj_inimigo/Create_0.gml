#region metodos
vida_ini = def_vida_ini*obj_gerador.dificuldade;
dar_moedas = false;
//hspeed = 3*def_vel_ini;
ia_inimigo = function()
{
    speed = 3*def_vel_ini;
    //indo na direção do meu inimigo
    direcao(global.mira_ini);
    dano = (def_dano_ini*global.dano*obj_gerador.dificuldade) - global.defesa
    if (vida_ini <= 0)
    {
    	instance_destroy();
    }
}

#endregion 