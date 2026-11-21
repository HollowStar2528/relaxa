if (global.pc == false) {
	instance_destroy();
}
//criando uma array
menu = ["Jogar", "Som", "Tutorial", "Sair"];
//criando uma váriavel atual
atual = 0;
//criando uma váriavel para a margem
margem = 30;


//criando metodo para desenhar o menu
desenha_menu = function()
{
    //definindo fonte
    draw_set_font(fnt_menu);
    //alinhando texto
    draw_set_valign(1);
    //pegando a altura da fonte
    var _alt = string_height("Ç")
    //criando váriavel temporaria para posicionar o texto
    var _meio_tela = display_get_gui_height()/2;
    //criando um laço de repetição for
    //ele usa um indice, uma condição e uma ação
    //meu indice começa em zero
    //minha condição é quando o i for menor que 3
    //minha ação é aumentar o valor do i em 1
    for(var i = 0; i < array_length(menu); i++)
    {
        //váriavel da cor do texto
        var _cor = c_white;
        //criando a váriavel temporaria para a margem
        var _marg = 0;
        //vou avisar para ele que minha opção atual tem que ficar fermelha
        //checando se o i do meu menu é igual a minha opção atual
        if(i == atual)
        {
            _cor = c_red;
            //o atual tem uma margem maior
            _marg = margem;
        }
        //desenhando textos do menu
        draw_set_colour(_cor);
        draw_text(20+_marg, _meio_tela + i * _alt - 125, menu[i]);
        draw_set_colour(-1);

        //
    }

    draw_set_font(-1);
    draw_set_valign(0);
}

//criando metodo para controlar o menu do jogo
controla_menu = function()
{
	//sempre que eu apertar a setinha para baixo eu quero descer o menu
	if(keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S")))
	{
		atual++;
		margem = 0;
	}
	//sempre que eu apertar a setinha para cima eu quero subir o menu
	if(keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W")))
	{
		atual--;
		margem = 0;
	}
	//limitando o movimento do meu menu
	atual = clamp(atual, 0, array_length(menu)-1);
	//melhorando a minha margem
	margem = lerp(margem, 30, .1);
	
	//checando se a pessoa precionou o enter
	if(keyboard_check_pressed(vk_enter) or mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_space))
	{
		//quando a pessoa precionar o enter, vai checar qual é a função que ela selecionou
		switch(atual)
		{
			//mochila
			case 0:
			{
				room_goto(rm_gameplay);
			}
			break;
			//interruptor da música
			case 1:
			{
				global.musica = !global.musica;
                global.som = !global.som;
			}
			break;
			//indo para o tutorial
			case 2:
			{
				room_goto(rm_tela_tutorial);
			}
			break;
			//saindo do jogo
			case 3:
			{
				game_end();
			}
			break;
		}
	}
}