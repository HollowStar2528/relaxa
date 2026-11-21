aciondado = false;
acionando = function ()
{
    if (aciondado) {
        som(snd_explosao);
        sprite_index = spr_circulo;
    	image_xscale++;
        image_yscale = image_xscale;
        if (image_xscale = 6) {
        	instance_destroy();
        }
    }
}