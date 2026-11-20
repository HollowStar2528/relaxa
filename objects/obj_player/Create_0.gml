randomise();

#region variaveis
//criando as variaveis do player
//velocidade
vel = 4;
//image_angle = direction;
//vida
vida_max = 100;
vida = vida_max;
feedback_vida = vida_max;
barra_vidaw = 200;
barra_vidah = 40;
recebi_dano = false;
tempo_indica_dano = 30;
//cor da barra de vida
cor1 = make_colour_rgb(255, 0, 0);//cor principal
cor2 = make_colour_rgb(128,128,128);
cor3 = c_white;
//recarga
segundos_reset = 90/global.recarga;
segundos = segundos_reset;

//habilidades
//regeneração
tempo_regen = 30;
regen = 0.1;
//clone
usei_clone = false;
tempo_clone = 120;
//circulo de energia
tempo_circu = 120;
dano_circu = 0.5;
usei_circu = false;
//mini player
mini_player = 0;
//tiro teleguiado
tempo_teleguiado = 120;
usei_teleguiado = false;
//invisibilidade
tempo_invisivel = 120;
usei_invi = false;
//escudo
tempo_escudo = 240;
//portal
tempo_portal = 240;
posx = noone;
posy = noone;
usei_portal = false;
//tiro de distração
tempo_distrai = 160;
//tiro paralisante
tempo_paralisia = 180;
//mina
tempo_mina = 240;

//tempo dos efeitos
//Superaquecimento
//tempo que o fogo dura
tempo_fogo = 60*5;
//turnos de fogo
dps_fogo = 60;
//congelado
tempo_gelo = 60*5;
//desnorteado
tempo_desnorteado = 60*3;
//cegado
tempo_cego = 60*3;
//lento
tempo_lento = 60*5
//pego no radar inimigo
radar = false;

#endregion

#region Metodos

//criando metodo para pegar os imputs do jogador
pega_imput = function()
{
    //se eu não estiver desnorteado então eu ando normalmente
    if (global.desnorteado == false) {
        up = keyboard_check(ord("W"));
        down = keyboard_check(ord("S"));
        right = keyboard_check(ord("D"));
        left = keyboard_check(ord("A"));
    }
    //se eu estiver desnorteado então os botões são invertidos
    else {
        up = keyboard_check(ord("S"));
        down = keyboard_check(ord("W"));
        right = keyboard_check(ord("A"));
        left = keyboard_check(ord("D"));
    }
    
    //habilidades
    //botão para invocar o clone
    clone_botao = keyboard_check_pressed(array_get(global.imput, 0));
    //botão para usar o circulo de energia
    circu_botao = keyboard_check_pressed(array_get(global.imput, 1));
    //botão para usar a invisibilidade
    invisivel_botao = keyboard_check_pressed(array_get(global.imput, 2));
    //botão para usar o escudo
    escudo_botao = keyboard_check_pressed(array_get(global.imput, 3));
    //botão para usar o portal
    portal_botao = keyboard_check_pressed(array_get(global.imput, 7));
    //botão para atirar a distração
    distrair_botao = keyboard_check_pressed(array_get(global.imput, 4));
    //botão para atirar o paralizante
    paralisa_botao = keyboard_check_pressed(array_get(global.imput, 6));
    //botão para colocar mina no chão
    mina_botao = keyboard_check_pressed(array_get(global.imput, 5));
}
//criando um metodo para controlar o jogador
controla_player = function()
{
    //se eu não estiver com lentidão então minha velocidade está normal
    if (global.lento = false) { 
        //aplicando a velocide
        vel = 4*global.velocidade;
    }
    //se eu estiver com lentidão então minha velocidade cai pela metade
    else {
    	vel = (4*global.velocidade)/2;
    }
    //aplicando isso aqui somente se eu estou apertando alguma tecla
	if(right xor left or up xor down)
	{
		//descobrindo a direção que a pessoa está indo
		var _dire = point_direction(0, 0, right - left, down - up);
		
		var _velh, _velv;
		//me mexendo horizontalmente
		_velh = lengthdir_x(vel, _dire);
		//me mexendo verticalmente
		_velv = lengthdir_y(vel, _dire);
		//movendo ele
		y += _velv;
		x += _velh;
	}
	//impedindo que ele saia pela esquerda
	if(x <= sprite_width/2) 
    {
        x = sprite_width/2;
    }
	//impedindo que ele saia pela direita
	if(x >= room_width - sprite_width/2) 
    {
        x = room_width - sprite_width/2;
    }
    if (x >= room_width - sprite_width/2 xor x <= sprite_width/2) { 
        global.xcolidi = true;
    }
    else { 
        global.xcolidi = false;
    }
	//impedindo que ele saia por cima e por baixo
    //o ultimo número indica até que coordenada ele pode descer
    y = clamp(y, sprite_height/2, 736);
    
    //tiros
    //recarga
    segundos_reset = 90/global.recarga;
    //atirando de tempos em tempos se tiver inimigos
    if (gerou_inimigo()) {
        if (segundos > 0) 
        {
        	segundos--;
        }
        else 
        {
        	instance_create_depth(x, y, depth+1, obj_bala_player);
            segundos = segundos_reset;
        }
    }
}
//checando se algum inimigo foi gerado
gerou_inimigo = function()
{
    var _gerou = instance_exists(obj_inimigo);
    var _gerou_parrudo = instance_exists(obj_inimigo_parrudo);
    if (_gerou or _gerou_parrudo) {
    	return true;
    }
}
//setando o display da camera
camera_display = function()
{
    //setando o display da câmera
    view_w = camera_get_view_width(view_camera[0]);
    view_h = camera_get_view_height(view_camera[0]);
    display_set_gui_size(view_w,view_h);
}
//metodo da vida do jogador
desenha_vida = function()
{
//desenhando a minha quantidade de vida atráves de uma barra de vida
    var  _amount, _amount_fixo, _amount_feedback, x1, y1, x2, y2, x3, x4; 
    //formula da barra de vida
    _amount = (vida/vida_max)*barra_vidaw; 
    //formula da barra de vida fixa
    _amount_fixo = (vida_max/vida_max)*barra_vidaw; 
    _amount_feedback = (feedback_vida/vida_max)*barra_vidaw;
    x1 = 1;
    y1 = 0;
    x2 = x1+_amount;
    y2 = y1+ barra_vidah;
    x3 = x1+_amount_fixo;
    x4 = x1+_amount_feedback;
    if(vida>0)
    {
        //desenhando o background
        draw_set_colour(cor2);
        draw_rectangle(x1,y1,x3,y2,1);
        draw_set_colour(-1);
        //desenhando o feedback
        draw_set_colour(cor3);
        draw_rectangle(x1,y1,x4,y2,0);
        draw_set_colour(-1);
        //desenhando a minha barra de vida
        draw_set_colour(cor1);
        draw_rectangle(x1,y1,x2,y2,0);
        draw_set_colour(-1);
    }
    else {
    	instance_create_layer(x, y, "Instances", obj_explosao_player);
    }
}
//habilidades que não foram usadas
habilidade = function()
{
    //usando a regeneração de vida se eu tiver ele
    //e o tempo de recarga tiver acabado
    //e eu não estiver com a vida cheia
    if (global.regen and vida < vida_max)
    {
        if (tempo_regen == 30) {
        	vida += regen;
            tempo_regen = 0;
        }
        else if (tempo_regen < 30) {
        	tempo_regen++;
        }
    }
    
    //clone
    if (usei_clone == false and clone_botao and global.clone and tempo_clone == 120) {
    	usei_clone = true;
    }
    
    //ativando o circulo de energia
    if (usei_circu == false and circu_botao and global.circulo and tempo_circu == 120) {
    	usei_circu = true;
    }
    
    //mini player
    if (global.mini_player and mini_player == 0) {
    	instance_create_layer(x+70, y-10, layer, obj_mini_player);
        mini_player++;
    }
    else if (global.mini_player and mini_player == 1) {
    	instance_create_layer(x-70, y-10, layer, obj_mini_player);
        mini_player++;
    }
    
    //tiro teleguiado
    if (usei_teleguiado == false and tempo_teleguiado == 120 and global.tiro_teleguiado) {
    	usei_teleguiado = true;
    }
    
    //imã
    if (global.ima) {
        var _ima = collision_circle(x, y, 120*2*(1+global.tamanho_bala), obj_saco_moedas, false, true);
        if (_ima)
        {
        	_ima.puxado = true;
        }
    }
    
    //invisivilidade
    //se eu liberei ela
    //se eu apertei no botão
    //e eu ainda não tenha usado a habilidade
    if (global.invisivel and invisivel_botao and usei_invi == false and tempo_invisivel == 120) {
        usei_invi = true;
    }
    
    //escudo
    if (global.escudo and escudo_botao and !instance_exists(obj_escudo) and tempo_escudo == 240) {
    	instance_create_depth(x, y, depth+1, obj_escudo);
    }
    
    //portal
    if (global.portal and portal_botao) {
    	if (usei_portal and tempo_portal == 240) {
            x = posx;
            y = posy;
            tempo_portal--;
            posx = noone;
            posy = noone;
            instance_destroy(obj_tp);
            usei_portal = false;
        }
        else if (usei_portal == false and tempo_portal == 240) {
        	posx = x;
            posy = y;
            instance_create_layer(posx, posy, layer, obj_tp);
            usei_portal = true;
        }
    }
    
    //tiro distrai
    if (global.distrair and distrair_botao and tempo_distrai == 160) {
    	instance_create_layer(x, y, layer, obj_bala_distrai_player);
        tempo_distrai--;
    }
    
    //tiro paralisa
    if (global.paralisante and paralisa_botao and tempo_paralisia == 180 and instance_exists(obj_inimigo)) {
    	instance_create_layer(x, y, layer, obj_bala_paralisa_player);
        tempo_paralisia--;
    }
    
    //mina
    if (global.mina and mina_botao and tempo_mina == 240) {
    	instance_create_layer(x, y, layer, obj_mina);
        tempo_mina--;
    }
    
}
//habilidades em uso ou em recarga
habilidade_uso = function()
{
    //clone
    if (usei_clone) {
        if (!instance_exists(obj_clone_player) and tempo_clone == 120) {
        	instance_create_depth(x, y, depth+1, obj_clone_player);
        }
        tempo_clone--;
    	if (tempo_clone <= 0) {
        	usei_clone = false;
        }
    }
    if (usei_clone == false and tempo_clone < 120) {
    	tempo_clone++;
    }
    
    //circulo de energia
    if (usei_circu) 
    {
        var _ini, _chamas; 
        _ini = collision_circle(x, y, 192*(1+global.tamanho_bala), obj_inimigo, false, true);
        _chamas = collision_circle(x, y, 192*(1+global.tamanho_bala), obj_chamas, false, true);
        
        tempo_circu--;
        if (_ini)
        {
        	_ini.vida_ini -= .02+((1*global.penetracao)/5);
            _ini.dar_moedas = true;
        }
    	if (tempo_circu <= -60)
        {
        	tempo_circu = -240/global.recarga;
            usei_circu = false;
        }
        //se eu colidi as chamas eu apago elas
        if (_chamas) {
        	instance_destroy(obj_chamas);
        }
    }
    //resetando o tempo
    if (tempo_circu != 120 and usei_circu == false) 
    {
    	tempo_circu++;
    }
    
    //tiro teleguiado
    if (usei_teleguiado) {
        if (!instance_exists(obj_bala_teleguiada_player) and tempo_teleguiado == 120) {
        	instance_create_layer(x, y, layer, obj_bala_teleguiada_player);
        }
        tempo_teleguiado--;
        if (tempo_teleguiado <= 0) {
        	usei_teleguiado = false;
        }
    }
    if (usei_teleguiado == false and tempo_teleguiado < 120) {
    	tempo_teleguiado++;
    }
    
    //invisibilidade
    if (usei_invi) {
    	tempo_invisivel--;
        if (tempo_invisivel <= -60) {
            tempo_invisivel = -240/global.recarga;
        	usei_invi = false;
        }
    }
    //resetando o tempo
    if (tempo_invisivel != 120 and usei_invi == false) {
    	tempo_invisivel++;
    }
    
    //escudo
    if (instance_exists(obj_escudo)) {
    	tempo_escudo--;
        if (tempo_escudo <= 0) {
        	tempo_escudo = -120/global.recarga;
            instance_destroy(obj_escudo);
        }
    }
    if (tempo_escudo != 240 and !instance_exists(obj_escudo)) {
        tempo_escudo++;
    }
    
    //portal
    if (tempo_portal < 240 and tempo_portal > 0) {
    	tempo_portal--;
    }
    else if (tempo_portal == 0) {
    	tempo_portal = 240;
    }
    
    //tiro distrai
    if (tempo_distrai != 160) {
    	tempo_distrai--;
        if (tempo_distrai <= -160/global.recarga) {
        	tempo_distrai = 160;
        }
    } 
    
    //tiro paralisa
    if (tempo_paralisia != 180) {
    	tempo_paralisia--;
        if (tempo_paralisia <= -180/global.recarga) {
        	tempo_paralisia = 180;
        }
    } 
    
    //mina
    if (tempo_mina != 240) {
    	tempo_mina--;
        if (tempo_mina <= -240/global.recarga) {
        	tempo_mina = 240;
        }
    }
}
//desenha habilidades
desenha_habilidade = function()
{
    //circulo
    if (usei_circu) {
    	draw_circle_colour(x, y, 192*(1+global.tamanho_bala), c_aqua, c_aqua, true);
    }
    //imã
    if (global.ima) {
    	draw_circle_colour(x, y, 120*2*(1+global.tamanho_bala), c_white, c_green, true);
    }
    //invisibilidade
    if (usei_invi) {
    	image_alpha = 0.5;
    }
    else {
    	image_alpha = 1;
    }
}
//pegando efeitos
efeitos = function()
{
    //efeito de superaquecimento
    if (global.superaquecimento) {
    	//eu subtraio o tempo de fogo
        tempo_fogo--;
        //se ele acabar o efeito termina
        if (tempo_fogo <= 0) {
        	global.superaquecimento = false;
        }
        //enquanto estiver pegando fogo, ele tomarar dano por segundo
        dps_fogo--;
        if (dps_fogo <= 0) {
            //causo dano no jogador
            vida-=5;
        	//reseto o dps
            dps_fogo = 60;
        }
    }
    //se ele estiver desativado então o tempo está desligado
    else {
    	tempo_fogo = 60*5;
        dps_fogo = 60;
    }
    
    //efeito de congelado
    if (global.congelado) {
    	//diminuo o tempo
        tempo_gelo--;
        //se o tempo acabar então o cogelamento terminou
        if (tempo_gelo <= 0) {
        	global.congelado = false;
        }
    }
    //se for falso então o tempo é resetado
    else {
    	tempo_gelo= 60*5;
    }
    
    //efeito de desnorteado
    if (global.desnorteado) {
    	//diminuo o tempo do desnorteamento
        tempo_desnorteado--;
        //se o tempo acabar então o efeito acabou
        if (tempo_desnorteado <= 0) {
        	global.desnorteado = false;
        }
    }
    //se for falso então o tempo reseta
    else {
    	tempo_desnorteado = 60*3;
    }
    
    //Efeito de cegueira
    if (global.cegado) {
    	//diminuo o tempo da cegueira
        tempo_cego--;
        //se o tempo acabar então o efeito chegou ao fim
        if (tempo_cego <= 0) {
        	global.cegado = false;
        }
    }
    //se eu não estiver cego então o tempo não roda
    else {
    	tempo_cego = 60*3;
    }
    
    //Efeito de lentidão
    if (global.lento) {
    	tempo_lento--;
        //se o tempo acabar então o efeito acabou
        if (tempo_lento <= 0) {
        	global.lento = false;
        }
    }
    //se eu não estou com lentidão então o tempo do efeito é resetado
    else {
    	tempo_lento = 60*5;
    }
}
//olhando para a direção correta
olhando = function()
{
    //Olhando para o inimigo mais proximo se ele existir
    if (instance_exists(obj_inimigo)) {
        var _y, _x, _olha;
        _x = instance_nearest(x,y, obj_inimigo).x;
        _y = instance_nearest(x, y, obj_inimigo).y;
        _olha = lerp(image_angle, point_direction(x, y, _x, _y), 0.05);
        image_angle = _olha;
        direction = image_angle;
    }
}
//dizendo que eu tomei dano
tomei_dano = function()
{
    if (recebi_dano) {
        tempo_indica_dano--;
        sprite_index = spr_jogador_dano;
        if (tempo_indica_dano <= 0) {
            tempo_indica_dano = 30;
            sprite_index = spr_jogador;
            recebi_dano = false;
        }
    }
}

#endregion


