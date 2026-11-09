image_xscale = 1+global.tamanho_bala;
image_yscale = image_xscale;
if (instance_exists(obj_inimigo)) {
	direcao(obj_inimigo);
}
if (instance_exists(obj_inimigo_parrudo)) {
	direcao(obj_inimigo_parrudo);
}
image_angle = direction;
durabilidade = 1*global.penetracao;
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
}


colide = function()
{
    var _ini, _ini_parrudo;
    _ini_parrudo = instance_place(x, y, obj_inimigo_parrudo);
    _ini = instance_place(x, y, obj_inimigo);
    if (_ini) {
        durabilidade--;
    	if (_ini.vida_ini > 0) {
        	_ini.vida_ini--;
        }
    }
    if (_ini_parrudo) {
        durabilidade--;
    	if (_ini_parrudo.vida_ini > 0) {
        	_ini_parrudo.vida_ini--;
        }
    }
}



