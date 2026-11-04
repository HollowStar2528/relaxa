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
barra_vidaw = 120;
barra_vidah = 20;
//cor da barra de vida
cor1 = make_colour_rgb(255, 0, 0);//cor principal
cor2 = make_colour_rgb(128,128,128);
cor3 = c_white;
//recarga
segundos_reset = 90/global.recarga;
segundos = segundos_reset;
//habilidades
//regeneração
tempo_regen = 120;
regen = 0.1;
usei_regen = false;
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
//imã
tempo_ima = 120;
usei_ima = false;

#endregion

#region Metodos

//criando metodo para pegar os imputs do jogador
pega_imput = function()
{
    up = keyboard_check(ord("W"));
    down = keyboard_check(ord("S"));
    right = keyboard_check(ord("D"));
    left = keyboard_check(ord("A"));
    //habilidades
    //botão para ativar o regen
    regen_botao = keyboard_check_pressed(vk_shift);
    //botão para invocar o clone
    clone_botao = keyboard_check_pressed(vk_space);
    //botão para usar o circulo de energia
    circu_botao = keyboard_check_pressed(vk_control);
    //ima botão
    ima_botao = keyboard_check_pressed(vk_alt);
}
//criando um metodo para controlar o jogador
controla_player = function()
{
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
    
    #region tiros
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
    if (_gerou) {
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
    _amount = (vida/vida_max)*barra_vidaw; //formula da barra de vida
    _amount_fixo = (vida_max/vida_max)*barra_vidaw; //formula da barra de vida fixa
    _amount_feedback = (feedback_vida/vida_max)*barra_vidaw
    x1 = (x) - (barra_vidaw/2);
    y1 = (y-50)  - (barra_vidah/2);
    x2 = x1+_amount;
    y2 = y1+ barra_vidah;
    x3 = x1+_amount_fixo;
    x4 = x1+_amount_feedback;
    if(vida>0)
    {
        //desenhando o background
        draw_set_colour(cor2);
        draw_rectangle(x1,y1,x2,y2,0)
        draw_set_colour(-1);
        //desenhando o feedback
        draw_set_colour(cor3);
        draw_rectangle(x1,y1,x4,y2,0)
        draw_set_colour(-1);
        //desenhando a minha barra de vida
        draw_set_colour(cor1);
        draw_rectangle(x1,y1,x2,y2,0);
        draw_set_colour(-1);
    }
    else {
        instance_destroy();
        reset();
    	instance_create_layer(x, y, "Instances", obj_explosao_player);
    }
}
//habilidades que não foram usadas
habilidade = function()
{
    //usando a regeneração de vida se eu tiver ele
    //tiver clicado no botão de uso
    //não tiver usado ele
    //e o tempo de recarga tiver acabado
    if (global.regen and regen_botao and usei_regen == false and tempo_regen == 120)
    {
    	usei_regen = true;
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
    if (usei_ima == false and tempo_ima == 120 and global.ima and ima_botao) {
    	usei_ima = true;
    }
}
//habilidades em uso ou em recarga
habilidade_uso = function()
{
    //regeneração
    if (usei_regen)
    {
    	tempo_regen--;
        if (vida < vida_max) 
        {
        	vida+=regen;
        }
        if (tempo_regen <= 60) {
            tempo_regen = 0;
        	usei_regen = false;
        }
    }
    //se o tempo de regen for menor que 120 e eu não tiver usado o regen então a recarga começa a voltar
    if (tempo_regen != 120 and usei_regen == false)
    {
    	tempo_regen++;
    }
    
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
        var _ini = collision_circle(x, y, 192*(1+global.tamanho_bala), obj_inimigo, false, false);
        
        tempo_circu--;
        if (_ini)
        {
        	_ini.vida_ini -= .02+((1*global.penetracao)/5);
            _ini.dar_moedas = true;
        }
    	if (tempo_circu <= -60)
        {
        	tempo_circu = -240;
            usei_circu = false;
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
    
    //imã
    if (usei_ima) 
    {
        var _ima = collision_circle(x, y, 120*2*(1+global.tamanho_bala), obj_saco_moedas, false, false);
        
        tempo_ima--;
        if (_ima)
        {
        	_ima.puxado = true;
        }
    	if (tempo_ima <= -120)
        {
        	tempo_ima = -240;
            usei_ima = false;
        }
    }
    //resetando o tempo
    if (tempo_ima != 120 and usei_ima == false) 
    {
    	tempo_ima++;
    }
}
//desenha habilidades
desenha_habilidade = function()
{
    if (usei_circu) {
    	draw_circle_colour(x, y, 192*(1+global.tamanho_bala), c_aqua, c_aqua, true);
    }
    if (usei_ima) {
    	draw_circle_colour(x, y, 120*2*(1+global.tamanho_bala), c_red, c_blue, true);
    }
}


#endregion


