//se eu ainda não escolhi então eu não desenho nada
if (escolhi == false) {
	exit;
}
//desenhando o botão que eu devo apertar, dependendo da sprite que eu estou usando
if (image_index == 0) {
	draw_text(x, y, "Q")
}
else if (image_index == 1) {
	draw_text(x, y, "E")
}
else if (image_index == 2) {
	draw_text(x, y, "R")
}
else if (image_index == 3) {
	draw_text(x, y, "F")
}
else if (image_index == 4) {
	draw_text(x, y, "Espaço")
}
else if (image_index == 5) {
	draw_text(x, y, "C")
}
else if (image_index == 6) {
	draw_text(x, y, "Control")
}
else if (image_index == 7) {
	draw_text(x, y, "Shift")
}
