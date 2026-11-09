//se eu colidi com a mina então eu começo a perder vida
var _mina = instance_place(x, y, obj_mina);
if (_mina.aciondado) {
	vida_ini--;
}
