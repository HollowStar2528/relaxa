//definindo o meu tamanho
image_xscale = 2;
image_yscale = image_xscale;
//variaveis
tempo = 80;
//metodo das chamas
contrala_chamas = function()
{
    //quando o tempo acabar eu me destruo
    tempo--;
    if (tempo <= 0) {
    	instance_destroy();
    }
    //variaveis temporarias
    var _colide;
    _colide = place_meeting(x, y, obj_player);
    //ao entrar em contato com o jogador, ele entra em estado de superaquecimento
    if (_colide) {
    	global.superaquecimento = true;
    }
}