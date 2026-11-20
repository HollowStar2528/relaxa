image_xscale = 2;
image_yscale = image_xscale;
escudo = function()
{
    x = obj_player.x;
    y = obj_player.y;
    image_angle = obj_player.image_angle;
    direction = image_angle;
    var _ini = instance_place(x, y, obj_inimigo);
    if (_ini) {
    	instance_destroy(_ini);
    }
}