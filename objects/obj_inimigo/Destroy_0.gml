// or obj_mina or obj_mini_bala_player or obj_bala_teleguiada_player
var _colide = [obj_bala_player, obj_mina, obj_mini_bala_player, obj_bala_teleguiada_player]
if (place_meeting(x, y, _colide)) {
	global.pontos += def_pontos*global.fortuna;
}
if (dar_moedas) {
	dar_moedas = false;
    global.pontos += def_pontos*global.fortuna;
}
instance_create_layer(x, y, "Instances", obj_explosao_ini);
var _espolio = irandom(100);
if (_espolio <= 15) {
	instance_create_layer(x, y, layer, obj_saco_moedas);
}
else if (_espolio == 16) {
	instance_create_layer(x, y, layer, obj_gas_cura);
}