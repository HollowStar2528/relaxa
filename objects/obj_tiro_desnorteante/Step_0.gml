//se o jogo estiver pausado então nada roda
if (global.pause) {
	speed = 0;
    exit;
}
controla_bala();