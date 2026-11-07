aciondado = false;
acionando = function ()
{
    if (aciondado) {
    	image_xscale++;
        image_yscale = image_xscale;
        if (image_xscale = 6) {
        	instance_destroy();
        }
    }
}