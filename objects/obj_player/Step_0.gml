if (global.pause) {
	exit;
}
pega_imput();
controla_player();
camera_display();
habilidade();
habilidade_uso();

//tomei dano então tenho um feedback da vida descendo
feedback_vida = sc_feedback_vida(feedback_vida, vida,1);
