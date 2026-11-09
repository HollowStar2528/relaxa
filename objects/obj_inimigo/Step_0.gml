//se o jogo for pausado, então o inimigo para tudo o que está fazendo
if (global.pause) {
    speed = 0;
	exit;
}
//caso o jogo não esteja pausado então o inimigo continua agindo normalmente
ia_inimigo();