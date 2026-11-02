image_speed = 0;
puxado = false;
mili_segundos = 0;
tempo = 0;
destruindo = function()
{
    if (mili_segundos < 30) {
    	mili_segundos++;
    }
    else {
    	mili_segundos = 0;
        tempo++;
    }
    if (tempo >= 3) {
    	image_speed = 1;
    }
    if (tempo >= 6) {
    	instance_destroy()
    }
}