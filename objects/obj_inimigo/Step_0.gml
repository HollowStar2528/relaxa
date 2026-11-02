if (global.pause) {
    speed = 0;
	exit;
}
if (instance_exists(obj_player)) {
	ia_inimigo();
}
