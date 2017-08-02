/// draw_map(surf, ds_grid, width, height)

var surf = argument0;
var ds_grid = argument1;
var width = argument2;
var height = argument3;

var w = ds_grid_width(ds_grid);
var h = ds_grid_height(ds_grid);
var cell_size = min(
    width / w,
    height / h);
var scale = cell_size / 64;
surface_resize(surf, cell_size * w, cell_size * h);
var l = w * h;
var shuffle = get_shuffle(l);
surface_set_target(surf);
for (var a = 0; a < l; a++) {
    var i = shuffle[a] mod w;
    var j = shuffle[a] div w;
    if (ds_grid[#i,j] == 1) {
        draw_sprite_ext(sWall, 0, i * cell_size, j * cell_size, scale, scale, 0, c_white, 1);
    }
}
surface_reset_target( );

