alarm[0] = 120;
global.mira_ini = obj_clone_player;
tempo = 120;
cronometro = function()
{
    tempo--;
    if (tempo <= 0) {
    	instance_destroy();
    }
}