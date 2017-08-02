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
surface_set_target(surf);
for (var i = 0; i < w; i++) {
    for (var j = 0; j < h; j++) {
        if (ds_grid[#i,j] == 1) {
            draw_sprite_ext(sWall, 0, i * cell_size, j * cell_size, scale, scale, 0, c_white, 1);
        }
    }
}
surface_reset_target( );

