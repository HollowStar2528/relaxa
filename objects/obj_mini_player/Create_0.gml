image_xscale = 0.5;
image_yscale = image_xscale;
image_blend = c_yellow;
vel = 4;
lado = noone;
//recarga
segundos_reset = 90/global.recarga;
segundos = segundos_reset;
colidindo = false;

//criando metodo para pegar os imputs do jogador
pega_imput = function()
{
    //se eu não estiver desnorteado então eu ando normalmente
    if (global.desnorteado == false) {
        up = keyboard_check(ord("W")) or keyboard_check(vk_up);
        down = keyboard_check(ord("S")) or keyboard_check(vk_down);
        right = keyboard_check(ord("D")) or keyboard_check(vk_right);
        left = keyboard_check(ord("A")) or keyboard_check(vk_left);
    }
    //se eu estiver desnorteado então os botões são invertidos
    else {
        up = keyboard_check(ord("S")) or keyboard_check(vk_down);
        down = keyboard_check(ord("W")) or keyboard_check(vk_up);
        right = keyboard_check(ord("A")) or keyboard_check(vk_left);
        left = keyboard_check(ord("D")) or keyboard_check(vk_right);
    }
}

//checando se algum inimigo foi gerado
gerou_inimigo = function()
{
    var _gerou = instance_exists(obj_inimigo);
    if (_gerou) {
    	return true;
    }
}

//criando um metodo para controlar o jogador
controla_mini_player = function()
{
    //aplicando velocidade
    vel = 4*global.velocidade;
    //aplicando isso aqui somente se eu estou apertando alguma tecla
	if(right xor left or up xor down)
	{
		//descobrindo a direção que a pessoa está indo
		var _dire = point_direction(0, 0, right - left, down - up);
		show_debug_message(_dire);
		var _velh, _velv;
		//me mexendo horizontalmente
		_velh = lengthdir_x(vel, _dire);
		//me mexendo verticalmente
		//_velv = lengthdir_y(vel, _dire);
		//movendo ele
        //y += _velv;
        if (global.xcolidi == false) {
            x += _velh;
        }
        if (instance_exists(obj_player)) {
        	y = obj_player.y-10
        }
	}
    
}

atira_mini = function ()
{
    //recarga
    segundos_reset = 90/global.recarga;
    //atirando de tempos em tempos se tiver inimigos
    if (gerou_inimigo()) {
        if (segundos > 0) 
        {
        	segundos--;
        }
        else 
        {
        	instance_create_depth(x, y, depth+1, obj_mini_bala_player);
            segundos = segundos_reset;
        }
    }
}

//olhando para a direção correta
olhando = function()
{
    //Olhando para o inimigo mais proximo se ele existir
    if (instance_exists(obj_inimigo)) {
        var _y, _x, _olha;
        _x = instance_nearest(x,y, obj_inimigo).x;
        _y = instance_nearest(x, y, obj_inimigo).y;
        _olha = lerp(image_angle, point_direction(x, y, _x, _y), 0.05);
        image_angle = _olha;
        direction = image_angle;
    }
}