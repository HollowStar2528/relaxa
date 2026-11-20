toquei = false;

tocando_musica = function()
{
    if (toquei = false) {
        //tocando a musica
        audio_play_sound(snd_fundo, 0, true, 0.2);
        //dizendo que eu comecei a tocar a musica
    	toquei = true;
    }
}