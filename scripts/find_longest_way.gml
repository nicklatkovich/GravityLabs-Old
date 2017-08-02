/// find_longest_way(ds_grid, start_pos)

var map = argument0;
var startXY = argument1;

var w = ds_grid_width(map);
var h = ds_grid_height(map);

var startX = startXY mod w;
var startY = startXY div w;

var grid = ds_grid_create(w, h);
ds_grid_clear(grid, -1);
grid[#startX,startY] = 0;
var q = ds_queue_create( );
var maxW = 0;
ds_queue_enqueue(q, startXY);
while (ds_queue_empty(q) == false) {
    var xy = ds_queue_dequeue(q);
    var xx = xy mod w;
    var yy = xy div w;
    var l = grid[#xx,yy] + 1;
    maxW = l - 1;
    var shuffle = get_shuffle(4);
    for (var i = 0; i < 4; i++) {
        var d = shuffle[i];
        var dx = Dx(d);
        var dy = Dy(d);
        var x1 = xx;
        var y1 = yy;
        var xp, yp;
        while (true) {
            xp = x1;
            yp = y1;
            x1 += dx;
            y1 += dy;
            if (map[#x1,y1] == 1) {
                if (grid[#xp,yp] == -1 || grid[#xp,yp] > l) {
                    grid[#xp,yp] = l;
                    ds_queue_enqueue(q, xp + yp * w);
                }
                break;
            }
        }
    }
}
ds_queue_destroy(q);
var a;
var aSize = 0;
for (var xx = 0; xx < w; xx++) {
    for (var yy = 0; yy < h; yy++) {
        if (grid[#xx,yy] == maxW) {
            a[aSize] = xx + yy * w;
            aSize++;
        }
    }
}
ds_grid_destroy(grid);

return a[rand(aSize)];

