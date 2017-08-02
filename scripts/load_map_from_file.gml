/// load_map_from_file(ds_grid, filename)

var ds_grid = argument0;
var filename = argument1;

var file = file_text_open_read(filename);
var width = file_text_read_real(file);
file_text_readln(file);
var height = file_text_read_real(file);
file_text_readln(file);
ds_grid_resize(ds_grid, width, height);
for (var yy = 0; yy < height; yy++) {
    var str = file_text_read_string(file);
    file_text_readln(file);
    for (var xx = 0; xx < width; xx++) {
        var cell_value = 0;
        switch (string_char_at(str, xx + 1)) {
            case '1':
                cell_value = 1;
                break;
        }
        ds_grid[#xx,yy] = cell_value;
    }
}
file_text_close(file);

