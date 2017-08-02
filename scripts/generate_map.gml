/// generate_map(ds_grid)

var map = argument0;

var w = ds_grid_width(map);
var h = ds_grid_height(map);

StartX = rand(w - 2) + 1;
StartY = rand(h - 2) + 1;

ds_grid_clear(map, 0);
map[#StartX,StartY] = 2;
var q = ds_queue_create( );
ds_queue_enqueue(q, StartX + StartY * w);

while (ds_queue_empty(q) == false) {
    var xy = ds_queue_dequeue(q);
    var xx = xy mod w;
    var yy = xy div w;
    map[#xx,yy] = 1;
    var shuffle = get_shuffle(4);
    for (var i = 0; i < 4; i++) {
        var d = shuffle[i];
        var dx = Dx(d);
        var dy = Dy(d);
        var a;
        var aSize = 0;
        var xp = xx;
        var yp = yy;
        while (true) {
            var x1 = xp + dx;
            var y1 = yp + dy;
            if (x1 < 0 || y1 < 0 || x1 >= w || y1 >= h) {
                break;
            }
            if ((map[#x1,y1] == 0 || map[#x1,y1] == 3) && map[#xp,yp] == 0) {
                a[aSize] = x1 + y1 * w;
                aSize++;
            }
            xp = x1;
            yp = y1;
            if (map[#x1,y1] == 2 || map[#x1,y1] == 3) {
                break;
            }
        }
        if (aSize > 0) {
            var xy1 = a[rand(aSize)];
            var x1 = xy1 mod w;
            var y1 = xy1 div w;
            map[#x1,y1] = 3;
            var xp = x1 - dx;
            var yp = y1 - dy;
            var xi = xx;
            var yi = yy;
            while (xi != xp || yi != yp) {
                xi += dx;
                yi += dy;
                map[#xi,yi] = 1;
            }
            map[#xp,yp] = 2;
            ds_queue_enqueue(q, xp + yp * w);
        }
    }
}

for (var i = 0; i < w; i++) {
    for (var j = 0; j < h; j++) {
//        if (map[#i,j] == 1 || map[#i,j] == 0) {
        if (map[#i,j] == 1) {
            map[#i,j] = 0;
        } else {
            map[#i,j] = 1;
        }
    }
}

