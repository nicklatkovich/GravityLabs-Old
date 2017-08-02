/// draw_back(surf, cell_size)

var surf = argument0;
var cell_size = argument1;

var w = ceil(surface_get_width(surf) / cell_size);
var h = ceil(surface_get_height(surf) / cell_size);
var s = w * h;
var scale = cell_size / 64;

var shuffle = get_shuffle(s);

surface_set_target(surf);
for (var a = 0; a < s; a++) {
    var i = shuffle[a] mod w;
    var j = shuffle[a] div w;
    draw_sprite_ext(sWall, 0, i * cell_size, j * cell_size, scale, scale, 0, c_gray, 1);
}
surface_reset_target( );

