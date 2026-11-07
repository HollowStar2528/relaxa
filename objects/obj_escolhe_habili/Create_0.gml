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
        array_push(global.ativas, 0);
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
        array_push(global.ativas, 1);
    }
    //se eu tiver selecionado a habilidade numero 5 a invocação é liberada
    if (_qual == 5) {
    	global.mini_player = true;
    }
    //se eu tiver selecionado a habilidade numero 6 a invisibilidade é liberada
    if (_qual == 6) {
    	global.invisivel = true;
        array_push(global.ativas, 2);
    }
    //se eu tiver selecionado a habilidade numero 7 o escudo é liberado
    if (_qual == 7) {
    	global.escudo = true;
        array_push(global.ativas, 3);
    }
    //se eu tiver selecionado a habilidade numero 8 o portal é liberado
    if (_qual == 8) {
    	global.portal = true;
        array_push(global.ativas, 4);
    }
    //se eu tiver selecionado a habilidade numero 9 o tiro de ditração é liberado
    if (_qual == 9) {
    	global.distrair = true;
        array_push(global.ativas, 5);
    }
    //se eu tiver selecionado a habilidade numero 10 o tiro paralisante é liberado
    if (_qual == 10) {
    	global.paralisante = true;
        array_push(global.ativas, 6);
    }
    //se eu tiver selecionado a habilidade numero 11 a mina é liberada
    if (_qual == 11) {
    	global.mina = true;
        array_push(global.ativas, 7);
    }
}