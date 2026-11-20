//tremendo a tela
//alterando a posição x e y do viewport com base no valor do treme
if(treme > 0.1)
{
	//variando o sentido da variável treme
	var _x = random_range(-treme, treme);
	var _y = random_range(-treme, treme);
	//alterando a posição x do viewport
	view_set_xport(view_current, _x);
	//alterando a posição y do viewport
	view_set_yport(view_current, _y);
}
else
{
	//se o treme chegou perto de 0 então eu zero
	treme = 0;
	//garanto que minha viewport zere também
	//alterando a posição x do viewport
	view_set_xport(view_current, 0);
	//alterando a posição y do viewport
	view_set_yport(view_current, 0);
}

//parando o meu treme de pouquinho em pouquinho
treme = lerp(treme, 0, .1);