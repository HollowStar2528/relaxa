instance_destroy();
if (obj_player.vida < 100) {
    var _cura = obj_player.vida_max - obj_player.vida;
	obj_player.vida+=_cura;
}