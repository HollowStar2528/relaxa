if (global.pause) {
	exit;
}
//só pego os meus imputs se eu não estiver congelado
if (global.congelado == false) {
	pega_imput();
    if (global.pc) {
    	pega_imput();
    }
    else {
        if (global.desnorteado) {
            x -= velh;
            y -= velv;
        }
        else { 
            if (global.lento) {
                x += velh*global.velocidade/2;
                y += velv*global.velocidade/2;
            }
            else {
                x += velh*global.velocidade;
                y += velv*global.velocidade;
            }
        }
    }
}
controla_player();
camera_display();
if (radar == false) {
	habilidade();
}
habilidade_uso();
efeitos();
tomei_dano();
//tomei dano então tenho um feedback da vida descendo
feedback_vida = sc_feedback_vida(feedback_vida, vida,1);