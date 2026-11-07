image_speed = 0;
image_index = def_index;
if (def_vendo == "recarga") {
	preco = 4;
}
if (def_vendo == "penetração") {
	preco = 4;
}
if (def_vendo == "defesa") {
	preco = 3;
}
if (def_vendo == "fortuna") {
	preco = 5;
}
if (def_vendo == "velocidade da bala") {
	preco = 3;
}
if (def_vendo == "tamanho da bala") {
	preco = 5;
}
if (def_vendo == "velocidade") {
	preco = 4;
}


vendo = function()
{
    if (preco <= global.moedas)
    {
        if (def_vendo == "recarga" and global.recarga < 2.5) 
        {
            global.moedas -= preco;
            global.recarga+=0.5;
            preco *= 2;
        }
        else if (def_vendo == "recarga" and global.recarga == 2.5) {
        	instance_destroy();
        }
        if (def_vendo == "penetração" and global.penetracao < 5) 
        {
            global.moedas -= preco;
            global.penetracao++;
            preco *= 2;
        }
        else if (def_vendo == "penetração" and global.penetracao == 5) {
        	instance_destroy();
        }
        if (def_vendo == "defesa")
        {
            global.moedas -= preco;
            global.defesa++;
            preco *= 2;
        }
        if (def_vendo == "fortuna")
        {
            global.moedas -= preco;
            global.fortuna++;
            preco *= 5;
        }
        if (def_vendo == "velocidade da bala" and global.vel_bala < 2.5)
        {
            global.moedas -= preco;
            global.vel_bala += .5;
            preco *= 3;
        }
        else if (def_vendo == "velocidade da bala" and global.vel_bala == 2.5) {
        	instance_destroy();
        }
        if (def_vendo == "tamanho da bala" and global.tamanho_bala < 3) {
        	global.moedas -= preco;
            global.tamanho_bala += .2;
            preco*= 2;
        }
        else if (def_vendo == "tamanho da bala" and global.tamanho_bala == 3) {
        	instance_destroy();
        }
        if (def_vendo == "velocidade" and global.velocidade < 3) {
        	global.moedas -= preco;
            global.velocidade += .2;
            preco*= 2;
        }
        else if(def_vendo == "velocidade" and global.velocidade == 3){
        	instance_destroy();
        }
    }
}