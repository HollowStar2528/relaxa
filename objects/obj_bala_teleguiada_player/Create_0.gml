image_xscale = 1+global.tamanho_bala;
image_yscale = image_xscale;
durabilidade = 1;
mili_segundos = 0;
segundos = 3;
coisas = function ()
{
    speed = 4*global.vel_bala;
    if (durabilidade<=0) {
    	instance_destroy();
    }
    if (mili_segundos < 60) {
    	mili_segundos++;
    }
    else {
    	mili_segundos = 0;
        segundos++;
    }
    if (segundos == 6) {
    	durabilidade--;
    }
}
sai = function()
{
    //impedindo que ele saia pela esquerda
	if(x <= -32) instance_destroy();
	//impedindo que ele saia pela direitass
	if(x >= room_width - sprite_width/2) instance_destroy();
	//impedindo que ele saia por cima e por baixo
    //o ultimo número indica até que coordenada ele pode descer
	if(y < -32) 
    {
        instance_destroy();
    }
    if (y > 800) {
    	instance_destroy();
    }
    if (instance_exists(obj_inimigo)) {
    	direcao(obj_inimigo);
    }
}


colide = function()
{
    var _ini //_ini = place_meeting(x, y, obj_inimigo);
    _ini = instance_place(x, y, obj_inimigo)
    if (_ini) {
        durabilidade--;
    	if (_ini.vida_ini > 0) 
        {
        	_ini.vida_ini -= 3*global.penetracao;
        }
    }
}



