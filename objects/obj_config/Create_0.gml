config_xp = function()
{
    if (global.pontos >= global.pontos_requeridos) {
        global.pontos -= global.pontos_requeridos;
    	global.pontos_requeridos += round(global.pontos_requeridos/4);
        global.moedas += 2*global.fortuna;
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