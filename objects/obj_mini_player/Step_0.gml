var _existe = instance_exists(obj_player);
if (global.pause or _existe == false) {
	exit;
}
gerou_inimigo();
//pega_imput();
//controla_mini_player();
if (lado == 1) {
	x = obj_player.x+70;
}
else if (lado == 2) {
	x = obj_player.x-70;
}
y = obj_player.y-10
olhando();
atira_mini();