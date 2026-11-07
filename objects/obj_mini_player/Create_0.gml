image_xscale = 0.5;
image_yscale = image_xscale;
image_blend = c_yellow;
vel = 4;
//recarga
segundos_reset = 90/global.recarga;
segundos = segundos_reset;
colidindo = false;

//criando metodo para pegar os imputs do jogador
pega_imput = function()
{
    up = keyboard_check(ord("W"));
    down = keyboard_check(ord("S"));
    right = keyboard_check(ord("D"));
    left = keyboard_check(ord("A"));
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