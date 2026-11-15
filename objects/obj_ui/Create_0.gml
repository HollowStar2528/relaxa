//Variaveis
//definindo o tamanho vertical da barra de xp
xph = 40;
//definindo o tamanho horizontal da barra de xp
xpw = 200;
//definido a cor da minha barra de xp
//cor de fundo da barra de xp
cor1 = c_dkgray;
//cor da frente da barra de xp
cor2 = c_aqua;

desenha_xp = function()
{
    //vriaveis temporarias
    var _x1, _y1, _x2, _y2, _x3, _x4, _xp, _xp_max;
    //sabendo quanto xp eu tenho
    _xp = global.pontos;
    //sabendo de quanto xp eu preciso
    _xp_max = global.pontos_requeridos;
    //posição x inicial da barra
    _x1 = 1;
    //posição y inicial da barra
    _y1 = 45;
    //posição x final da barra
    _x2 = _x1+_xp;
    //posição x fixa da barra para servir como background
    _x3 = (_xp_max/_xp_max)*xpw;
    //posição y final da barra
    _y2 = _y1+xph;
    
    //desenhando o fundo da minha barra de xp
    draw_set_colour(cor1);
    draw_rectangle(_x1,_y1,_x3,_y2,1);
    draw_set_colour(-1);
    
    //desenhando a frente da minha barra de xp
    draw_set_colour(cor2);
    draw_rectangle(_x1,_y1,_x2,_y2,0);
    draw_set_colour(-1);
}