//ao me colidi com o jogador eu me destruo
instance_destroy();
//e causo dano nele se o dano for maior que zero
if (dano > 0) {
	obj_player.vida -= dano;
}
