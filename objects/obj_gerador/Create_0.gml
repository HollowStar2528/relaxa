//variaveis
mili_segundos = 0;
segundos_difi = 0;
segundos_max = 15;
//Inimigo base
segundos_base = 0;
//inimigo atirador
segundos_atirador = 0;
//inimigo bombardeiro
segundos_bombardeiro = 0;
//inimigo cego
segundos_cegador = 0;
//inimigo quente
segundos_queimadinho = 0;
//inimigo gelado
segundos_geladinho = 0;
//inimigo atirador lerdo
segundos_lerdo = 0;
//inimigo parrudo
segundos_parrudo = 0;
//inimigo desnorteador
segundos_desnorteador = 0;
//inimigo sonar
segundos_sonar = 0;
//quantidade de inimigos na tela
quant_max = 5;
quant_atual = 0;
//diminuindo o tempo de geração de inimigos
menos_tempo = 1;
//dificuldade para aparecer inimigos
dificuldade = 1;

//criando controle do gerador
gerador = function()
{
    //quando os mili segundos chegar a 60, ele zera e os segundos sobem
    mili_segundos++;
    if (mili_segundos >= 60) {
    	//zerando os mili segundos
        mili_segundos = 0;
        //passando o segundo do inimigo 1
        segundos_base++;
        //passando o segundo do inimigo 2
        segundos_atirador++;
        //passando o segundo do inimigo 3
        segundos_bombardeiro++;
        //passando o segundo do inimigo 4
        segundos_cegador++;
        //passando o segundo do inimigo 5
        segundos_queimadinho++;
        //passando o segundo do inimigo 6
        segundos_geladinho++;
        //passando o segundo do inimigo 7
        segundos_lerdo++;
        //passando o segundo do inimigo 8
        segundos_parrudo++;
        //passando o segundo do inimigo 9
        segundos_desnorteador++;
        //passando o segundo do inimigo 10
        segundos_sonar++;
        //passando o segundo de dificuldade
        segundos_difi++;
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 1) {
        //inimigo base
    	//os inimigos serão gerados a cada 2 segundos se já não tiver muitos inimigos em tela
        if (segundos_base >= round(2/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_base = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 2) {
        //inimigo base
    	//os inimigos serão gerados a cada 4 segundos se não tiver muitos inimigos em tela
        if (segundos_atirador >= round(4/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_atira);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_atirador = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 3) {
        //inimigo base
    	//os inimigos serão gerados a cada 5 segundos se não tiver muitos inimigos em tela
        if (segundos_bombardeiro >= round(5/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_bomba);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_bombardeiro = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 4) {
        //inimigo base
    	//os inimigos serão gerados a cada 5 segundos se não tiver muitos inimigos em tela
        if (segundos_cegador >= round(5/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_cego);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_cegador = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 5) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_queimadinho >= round(5/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_incediario);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_queimadinho = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 5) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_geladinho >= round(5/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_gelado);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_geladinho = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 6) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_lerdo >= round(5/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_lento);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_lerdo = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 7) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_parrudo >= round(6/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_parrudo);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_parrudo = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 8) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_desnorteador >= round(7/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_desnorteador);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_desnorteador = 0;
        }
    }
    //gerando determinado inimigo dependendo da dificuldade
    if (dificuldade >= 9) {
        //inimigo base
    	//os inimigos serão gerados a cada 6 segundos se não tiver muitos inimigos em tela
        if (segundos_sonar >= round(8/menos_tempo) and quant_atual < quant_max) {
            //a quantidade invocada depente da dificuldade
            repeat (1) {
            	//sabendo aonde ele vai aparecer
                var _x, _y;
                //aleatorizando o eixo x
                _x = irandom_range(-92, 1440);
                //escolhendo o eixo y
                _y = choose(-128, 864);
                instance_create_layer(_x, _y, "ins_ini", obj_inimigo_radar);
            }
            //dizendo que mais um inimigo foi gerado
            quant_atual++;
            //reseto os segundos
            segundos_sonar = 0;
        }
    }
    
    //subindo a dificuldade
    if (segundos_difi == segundos_max) {
    	//zero os meus segundos
        segundos_difi = 0;
        //aumento os segundos max
        segundos_max += round(segundos_max/2);
        //aumentando a dificuldade dos inimigos
        dificuldade++;
    }
    //definindo a quantidade maxima de inimigos em tela, dependendo da dificuldade do jogo
    //se eu já tiver chegado na dificuldade 3 então eu posso ter 7 inimigos em tela
    if (dificuldade == 3) {
    	quant_max = 7;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 4) {
    	quant_max = 10;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 5) {
    	quant_max = 13;
        //diminuindo o meu tempo de coll down de dificuldade
        segundos_max = 20;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 6) {
    	quant_max = 18;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 7) {
    	quant_max = 24;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 8) {
    	quant_max = 30;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 9) {
    	quant_max = 35;
        //diminuindo o meu tempo de coll down de dificuldade
        segundos_max = 20;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 10) {
    	quant_max = 40;
        menos_tempo = 2;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 11) {
    	quant_max = 50;
    }
    //se eu já tiver chegado na dificuldade 5 então eu posso ter 10 inimigos em tela
    if (dificuldade == 12) {
    	quant_max = 60;
    }
}