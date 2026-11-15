//Separando o sistema de pontos e de moedas
config_xp = function()
{
    if (global.pontos >= global.pontos_requeridos) {
        //subitraindo os meus pontos pelos pontos requeridos
        global.pontos -= global.pontos_requeridos;
        //aumentando a quantidade de pontos requeridos para subir de nivel
    	global.pontos_requeridos += global.pontos_requeridos;
        //subindo de nivel
        global.nivel += 1; 
        //ativando escolhas de habilidades ao subir de nivel
        global.pause = true;
        global.escolhendo = true;
        //escolhendo a minha habilidade se eu ainda não escolhi 5 habilidades
        if (array_length(global.quant_habili) < 5) {
        	escolhe_habilidade();
        }
        //se eu já escolhi as minhas 5 habilidades então eu ganho dinheiro
        else {
        	global.moedas+= irandom_range(1*global.fortuna, 4*global.fortuna);
            global.escolhendo = false;
            global.pause = false;
        }
    }
}


mili_segundos = 0;
segundos = 0;
minutos = 0;
horas = 0;

cronometro = function()
{
    if (mili_segundos <60) {
    	mili_segundos++;
    }
    if (mili_segundos == 60) {
    	mili_segundos = 0;
        segundos++;
    }
    if (segundos == 60) {
    	segundos = 0;
        minutos++;
    }
    if (minutos == 60) {
    	minutos = 0;
        horas++;
    }
    draw_text(x, y, string(horas) + " : " + string(minutos) + " : " + string(segundos))
}



#region debug
view_player = noone;

//método de debug do jogo
roda_debug = function ()
{
    show_debug_overlay(1);
    
    //criando o meu bagui de debug dentro do view
    view_player = dbg_view("View player", 1, 0, 19, 400, 400);
    //vendo algumas informações
    dbg_watch(ref_create(obj_player, "vida"), "Vida");
    dbg_watch(ref_create(global, "moedas"), "Moedas");
    dbg_watch(ref_create(global, "nivel"), "nivel");
    dbg_watch(ref_create(global, "pontos"), "Pontuação");
    dbg_watch(ref_create(global, "quant_habili"), "habilidades selecionadas");
    dbg_watch(ref_create(global, "ativas"), "habilidades ativas");
    
    //vendo os efeitos no jogador
    dbg_watch(ref_create(global, "superaquecimento"), "Superaquecimento");
    dbg_watch(ref_create(global, "congelado"), "Congelado");
    dbg_watch(ref_create(global, "desnorteado"), "Desnorteado");
    dbg_watch(ref_create(global, "cegado"), "Cegueira");
    dbg_watch(ref_create(global, "lento"), "Lentidão");
    
    
    //vendo se as habilidades estão ativadas ou não
    dbg_watch(ref_create(global, "regen"), "regen");
    dbg_watch(ref_create(global, "clone"), "clone");
    dbg_watch(ref_create(global, "circulo"), "circulo");
    dbg_watch(ref_create(global, "mini_player"), "mini_player");
    dbg_watch(ref_create(global, "tiro_teleguiado"), "Tiro teleguiado");
    dbg_watch(ref_create(global, "ima"), "Imã");
    dbg_watch(ref_create(global, "invisivel"), "Invisivel");
    dbg_watch(ref_create(global, "escudo"), "Escudo");
    dbg_watch(ref_create(global, "portal"), "Portal");
    dbg_watch(ref_create(global, "distrair"), "Distrair");
    dbg_watch(ref_create(global, "paralisante"), "Paralisante");
    dbg_watch(ref_create(global, "mina"), "Mina");
    
    //exemplo
    //vendo as informações da minha velv
    //dbg_watch(ref_create(id, "velv"), "velv");
    //podendo alterar a minha grav
    //dbg_slider(ref_create(id, "max_velh"), 0, 10, "max_velh", .25);
}

ativa_debug = function()
{
    //alternando o modo debug
    if (keyboard_check_pressed(vk_backspace))
    {
        //se ele é verdadeiro ele vira falso e se é falso ele vira verdadeiro
    	global.debug = !global.debug;
        //se o jogo está no modo roda debug então eu ativo o meu debug
        if (global.debug)
        {
            //rodando o meu debug
        	roda_debug();
        }
        else 
        {
            //desativo o meu debug overley
            show_debug_overlay(0);
        	//se a minha view existe e eu não estou no modo debug eu deleto ela
            if (dbg_view_exists(view_player))
            {
            	dbg_view_delete(view_player);
            }
        }
    }
}

#endregion