//dizendo a direção que eu tenho que ir
direcao(global.mira_ini);
//variaveis
tempo = 60;
controla_bala = function()
{
    //definindo a velocidade do tiro
    speed = 4;
    var _colide, _dano;
    //defindo o meu dano
    _dano = (global.dificuldade*2)-global.defesa;
    //variavel para checar a colisão com o player
    _colide = place_meeting(x, y, obj_player);
    //se eu me colidir com ele ou o tempo acabar eu me destruo, causo dano e invoco a aréa de chamas
    tempo--;
    if (_colide or tempo <= 0) {
        //causando dano se ele for maior que 0
        if (_dano > 0) {
        	obj_player.vida-= _dano;
            obj_player.recebi_dano = true;
        }
        //invocando a aréa incendiaria
        instance_create_layer(x, y, layer, obj_chamas);
    	//me destruo
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