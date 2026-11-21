//feadback da vida
function sc_feedback_vida(val1, val2, amount){
    if (val1< val2) 
    {
        val1+= amount;
        if (val1>val2) 
        {
        	return val2;
        }
    	
    }
    else
    {
    	val1 -= amount;
        if (val1< val2)
        {
        	return val2;
        }
    }
    return val1;

}

//indo na direção desejada
function direcao(_direcao = obj_player)
{
    var _y, _x;
    _x = instance_nearest(x,y, _direcao).x;
    _y = instance_nearest(x, y, _direcao).y;
    direction = point_direction(x, y, _x, _y);
}

//funcionalidade do pause
function pausei(_opacidade = 1)
{
    if (global.loja == false)
    {
    	image_alpha = 0;
        exit;
    }
    else 
    {
    	image_alpha = _opacidade;
    }
}

//resetando o jogo
function reset()
{
    //MELHORIAS
    //aumenta a durabilidade da arma
    global.penetracao = 1;
    //recarga mais rapida
    global.recarga = 1;
    //tendo mais resistencia
    global.defesa = 0;
    //fortuna
    global.fortuna = 1;
    //velocidade da bala
    global.vel_bala = 1;
    //tamanho da bala
    global.tamanho_bala = 0;
    
    //HABILIDADES
    //regeneração
    global.regen = false;
    //clonar player
    global.clone = false;
    //circulo de energia que causa dano por segundo nos inimigos
    global.circulo = false;
    //mini players
    global.mini_player = false;
    //tiro teleguiado
    global.tiro_teleguiado = false;
    //imã
    global.ima = false;
    //invisibilidade
    global.invisivel = false;
    //escudo
    global.escudo = false;
    //portal
    global.portal = false;
    //distração
    global.distrair = false;
    //tiro paralisante
    global.paralisante = false;
    //mina
    global.mina = false;
    
    //VARIAVEIS
    global.pontos_requeridos = 1;
    global.pontos = 0;
    global.moedas = 0;
    //mira do inimigo
    global.mira_ini = obj_player
    //pausado
    global.pause = false;
    //colidi
    global.xcolidi = false;
    //Nivel do jogador
    global.nivel = 0;
    //habilidades selecionadas
    global.quant_habili = [];
    //habilidades ativas
    global.ativas = [];
    
    //EFEITOS
    //superaquecimento(queimando)
    global.superaquecimento = false;
    //congelado
    global.congelado = false;
    //desnorteado
    global.desnorteado = false;
    //cegueira
    global.cegado = false;
    //lentidão
    global.lento = false;
    
    //PARANDO COISAS
    audio_stop_all();
}

//randomizando as habilidades escolhidas
function escolhe_habilidade()
{
    //criar 3 habilidades
    //elas não podem ser iguais
    var _xpos, _id, _valor, _check;
    _xpos = 0;
    _check = [];
    repeat (3) {
        _valor = irandom(11);
        //criando a carta de habilidade e salvando o id dela
    	_id = instance_create_layer(570+_xpos, 384, layer, obj_escolhe_habili);
        //se o valor da carta seja novo, ele for diferente de nenhum e não tiver sido escolhido antes então ele aparece
        if (!array_contains(_check, _valor) and _valor != -4 and !array_contains(global.quant_habili, _valor)) {
        	_id.valor = _valor;
            array_push(_check, _valor);
        }
        //caso a carta já tiver sido selecionada antes ou o jogo não tenha gerado nenhum numero diferente ela se destroi
        else {
        	instance_destroy(_id);
        }
        //mudando a posição da proxima carta que será gerada
        _xpos+=102;
    }
}

//Tocador de sons do jogo
function som(_som = snd_morreu)
{
    if (global.som) {
        //toco o som
        audio_play_sound(_som, 1, 0);
    }
}

//função para fazer a tela tremer
function tremendo_tela(_valor = 0)
{
	if(instance_exists(obj_screenshake))
	{
		//checando se o valor de treme atual é maior que o valor de treme do objeto
		//screenshake
		//acessando o objeto screenshake
		with(obj_screenshake)
		{
			//meu código vai rodar dentro do objeto screenshake
			//se o meu treme novo for maior que o treme atual
			if(_valor > treme)
			{
				//ai eu substituo o meu atual
				treme = _valor
			}
		}
		//passando para ele o valor de treme
		obj_screenshake.treme = _valor;
	}
}

//efeito para o jogador ficar pegando fogo
function desenhando_efeito_queimado(_funcao_desenho = draw_self)
{
	if(global.superaquecimento)
	{
		image_blend = c_orange;
		_funcao_desenho();
		image_blend = c_white;
	}
	else
	{
		_funcao_desenho();
	}
}