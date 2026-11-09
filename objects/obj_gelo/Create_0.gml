//definindo a aréa de explosão
area = 0;
//definindo se eu causei dano
causei = false;
//metodo de controle da bomba
controla_bomba = function()
{
    //aumentando o tamanho da bomba
    image_xscale+=0.2;
    image_yscale = image_xscale;
    //se eu colidir com o jogador eu causo dano se eu ainda tiver causado
    var _colidi = place_meeting(x, y, obj_player);
    if (_colidi) {
        if (causei == false) {
            //dizendo quanto de dano eu devo causar
            var _dano = (global.dificuldade*2)-global.defesa;
            //causando o dano se o meu dano for maior que 0
            if (_dano > 0) { 
                obj_player.vida -= _dano;
            }
            //avisando que eu congelei o jogador
            global.congelado = true;
            //causei dano
        	causei = true;
        }
    }
    //quando ela chega ao tamanho maximo eu me destruo
    if (image_xscale >= area) {
        instance_destroy();
    }
}