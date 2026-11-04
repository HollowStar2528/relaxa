//zerando o tempo de velocidade da imagem
image_speed = 0;
valor = noone;
id_habilidade = noone;

habilidade = function(_qual = valor)
{
    //se eu tiver selecionado a habilidade numero 0 o imã é liberado
    if (_qual == 0) {
    	global.ima = true;
    }
    //se eu tiver selecionado a habilidade numero 1 a clonagem é liberada
    if (_qual == 1) {
    	global.clone = true;
    }
    //se eu tiver selecionado a habilidade numero 2 a regeneração é liberada
    if (_qual == 2) {
    	global.regen = true;
    }
    //se eu tiver selecionado a habilidade numero 3 o tiro teleguiado é liberado
    if (_qual == 3) {
    	global.tiro_teleguiado = true;
    }
    //se eu tiver selecionado a habilidade numero 4 o circulo de energia é liberado
    if (_qual == 4) {
    	global.circulo = true;
    }
    //se eu tiver selecionado a habilidade numero 5 a invocação é liberada
    if (_qual == 5) {
    	global.mini_player = true;
    }
    //se eu tiver selecionado a habilidade numero 6 a invisibilidade é liberada
    if (_qual == 6) {
    	global.invisivel = true;
    }
    //se eu tiver selecionado a habilidade numero 7 o escudo é liberado
    if (_qual == 7) {
    	global.escudo = true;
    }
    //se eu tiver selecionado a habilidade numero 8 o portal é liberado
    if (_qual == 8) {
    	global.portal = true;
    }
    //se eu tiver selecionado a habilidade numero 9 o tiro de ditração é liberado
    if (_qual == 9) {
    	global.distrair = true;
    }
    //se eu tiver selecionado a habilidade numero 10 o tiro paralisante é liberado
    if (_qual == 10) {
    	global.paralisante = true;
    }
    //se eu tiver selecionado a habilidade numero 11 a mina é liberada
    if (_qual == 11) {
    	global.mina = true;
    }
}