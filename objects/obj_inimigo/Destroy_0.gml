if (place_meeting(x,y, obj_bala_player)) {
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