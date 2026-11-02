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
    if (global.pause == false)
    {
    	image_alpha = 0;
        exit;
    }
    else 
    {
    	image_alpha = _opacidade;
        //exit;
    }
}

function reset()
{
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
    
    //habilidades
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
    
    global.pontos_requeridos = 5;
    global.pontos = 0;
    global.moedas = 0;
    //dano do inimigo
    global.dano = 5;
    //mira do inimigo
    global.mira_ini = obj_player
    //pausado
    global.pause = false;
    //colidi
    global.xcolidi = false;
}