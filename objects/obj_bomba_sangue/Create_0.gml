som(snd_explosao);
//definindo a aréa de explosão
area = 3.2;
//definindo se eu causei dano
causei = false;
//metodo de controle da bomba
controla_bomba = function()
{
    //aumentando o tamanho da bomba
    image_xscale+=0.2;
    image_yscale = image_xscale;
    //se eu colidir com o jogador eu cego ele
    var _colidi = place_meeting(x, y, obj_player);
    if (_colidi) {
        if (causei == false) {
            //então eu cego o jogador
            global.cegado = true;
            //e aviso que eu já ceguei ele
            causei = true;
        }
    }
    //quando ela chega ao tamanho maximo eu me destruo
    if (image_xscale >= area) {
        instance_destroy();
    }
}