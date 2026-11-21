toquei = false;
audio_stop_all();
tocando_musica = function()
{
    if (toquei == false and global.musica) {
        //tocando a musica
        audio_play_sound(snd_fundo, 0, true, 0.2);
        //dizendo que eu comecei a tocar a musica
    	toquei = true;
    }
    if (global.musica == false) {
    	audio_pause_sound(snd_fundo);
        toquei = false;
    }
}