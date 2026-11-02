if (global.pause) {
    speed = 0;
	exit;
}
speed = 2*global.vel_bala;
if (durabilidade<=0) {
	instance_destroy();
}
sai();
colide();