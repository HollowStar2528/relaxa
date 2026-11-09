//se o inimigo morrer por ter colidido com o jogador então ele não da pontos
var _colide = obj_player;
if (!place_meeting(x, y, _colide)) {
    //ao morrer, os pontos dados são definidos pelos proprios pontos base que o inimigo droparia, multiplicado pela fortuna
	global.pontos += def_pontos*global.fortuna;
}
//ao morrer ele cria particulas de explosão
instance_create_layer(x, y, "Instances", obj_explosao_ini);
//além disso, ao morrer, ele gira uma "roleta"
var _espolio = irandom(100);
//essa roleta chamada de espolio define se ele vai dropar alguma coisa
//se o espolio cair entre 0 e 15 então ele dropa um saco de cristais
if (_espolio <= 15) {
	instance_create_layer(x, y, layer, obj_saco_moedas);
}
//se cair em 16 então dropa uma garrafa de H2O que cura o jogador
else if (_espolio == 16) {
	instance_create_layer(x, y, layer, obj_gas_cura);
}
//o jogador com certeza pode usar a habilidade
obj_player.radar = false;