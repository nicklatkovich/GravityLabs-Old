/// short_way(ds_grid, xf, yf, xt, yt)

var grid = argument0;
var xf = argument1;
var yf = argument2;
var xt = argument3;
var yt = argument4;

var w = ds_grid_width(grid);
var h = ds_grid_height(grid);

var result = undefined;
var resultLength = 0;

var temp = ds_grid_create(w, h);
var dirs = ds_grid_create(w, h);
ds_grid_clear(temp, -1);
ds_grid_clear(dirs, -1);
temp[#xf,yf] = 0;
dirs[#xf,yf] = -1;
var q = ds_priority_create( );
ds_priority_add(q, xf + yf * w, 0);
while (temp[#xt,yt] == -1) {
    var xy = ds_priority_find_min(q);
    ds_priority_delete_min(q);
    var xx = xy mod w;
    var yy = xy div w;
    var dprev = dirs[#xx,yy];
    for (var d = 0; d < 4; d++) {
        var x1 = xx + Dx(d);
        var y1 = yy + Dy(d);
        if (x1 >= 0 && x1 < w && y1 >= 0 && y1 < h) {
            var l = temp[#xx,yy];
            switch (grid[#x1,y1]) {
                case 0:
                    l++;
                    break;
                case 1:
                    l += 5;
                    break;
                case 2:
                    l += 100;
                    break;
                case 3:
                    l += 10;
                    break;
                case 4:
                case 5:
                    l += 0.0001;
                    break;
            }
            if (grid[#x1,y1] != 4 && grid[#x1,y1] != 5) {
                if ((d + 2) mod 4 != dprev) {
                    l++;
                }
            }

            if (temp[#x1,y1] == -1 || temp[#x1,y1] > l) {
                temp[#x1,y1] = l;
                dirs[#x1,y1] = (d + 2) mod 4;
                ds_priority_add(q, x1 + y1 * w, l);
            }
        }
    }
}

var xx = xt;
var yy = yt;
resultLength++;
result[resultLength] = xx + yy * w;
while (xx != xf || yy != yf) {
    var d = dirs[#xx,yy];
    xx += Dx(d);
    yy += Dy(d);
    resultLength++;
    result[resultLength] = xx + yy * w;
}
result[0] = resultLength;
result[resultLength + 1] = temp[#xt,yt];
ds_priority_destroy(q);
ds_grid_destroy(temp);
ds_grid_destroy(dirs);

return result;

