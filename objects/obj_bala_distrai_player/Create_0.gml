image_xscale = 1+global.tamanho_bala;
image_yscale = image_xscale;
direction = irandom(359);
image_angle = direction;
global.mira_ini = obj_bala_distrai_player;
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




