if (global.pause) {
	exit;
}
if (tempo != 0) {
	tempo--;
}
else if (tempo==0) {
	instance_destroy();
}