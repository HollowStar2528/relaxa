segundos_totais = 85;
segundos_restantes = segundos_totais;
dificuldade = 1;
//alarm[0] = 60*60*2;

mili_segundos = 0;
segundos = 0;
minutos = 0;

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
    if (minutos == 4)
    {
        dificuldade = 2;
    }
    if (minutos == 8)
    {
        dificuldade = 3;
    }
}

invocar_inimigo_fraco= function()
{
    var _x, _x2, _y, _y2, _dir, _esq;
     _esq = 1408;
    _dir = -33;
    _x = choose(_dir, _esq);
    _y = irandom_range(-32, 800);
    _x2 = choose(_dir, _esq);
    _y2 = irandom_range(-32, 800);
    if (segundos_restantes > 0)
    {
    	segundos_restantes--;
    }
    if (dificuldade == 1 and segundos_restantes == 0)
    {
        instance_create_layer(_x, _y, layer, obj_inimigo);
    	segundos_restantes = segundos_totais;
    }
    if (dificuldade == 2 and segundos_restantes == 0)
    {
        instance_create_layer(_x, _y, layer, obj_inimigo);
        instance_create_layer(_x2, _y2, layer, obj_inimigo2);
    	segundos_restantes = segundos_totais;
    }
    if (dificuldade == 3 and segundos_restantes == 0)
    {
        instance_create_layer(_x, _y, layer, obj_inimigo);
        instance_create_layer(_x2, _y2, layer, obj_inimigo2);
        instance_create_layer(_x, -96, layer, obj_meteoro);
    	segundos_restantes = segundos_totais;
    }
}