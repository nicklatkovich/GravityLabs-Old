/// load_map_from_file(ds_grid, filename)

var ds_grid = argument0;
var filename = argument1;

var str;
var args;
var file = file_text_open_read(filename);

// map width
var width = file_text_read_real(file);
file_text_readln(file);

// map height
var height = file_text_read_real(file);
file_text_readln(file);
ds_grid_resize(ds_grid, width, height);

// walls
for (var yy = 0; yy < height; yy++) {
    str = file_text_read_string(file);
    file_text_readln(file);
    for (var xx = 0; xx < width; xx++) {
        ds_grid[#xx,yy] = real(string_char_at(str, xx + 1));
    }
}

// start
file_text_readln(file);
StartX = file_text_read_real(file);
file_text_readln(file);
StartY = file_text_read_real(file);
file_text_readln(file);

// finish
file_text_readln(file);
FinishX = file_text_read_real(file);
file_text_readln(file);
FinishY = file_text_read_real(file);
file_text_readln(file);

// items
file_text_readln(file);
while (true) {
    str = file_text_read_string(file);
    file_text_readln(file);
    if (str == '[Outputs]') {
        break;
    } else {
        args = split(str, ' ');
        var iid = real(args[0]);
        if (iid == ItemsCount) {
            var itemType = undefined;
            switch (args[1]) {
                case 'L':
                    itemType = oLaserGenerator;
                    break;
                case 'M':
                    itemType = oElectroBlock;
                    break;
                case 'K':
                    itemType = oButton;
                    break;
                case 'C':
                    itemType = oComp;
                    break;
            }
            var xx = real(args[2]);
            var yy = real(args[3]);
            var dir = real(args[4]);
            Items[iid] = instance_create(xx, yy, itemType);
            Items[iid].Dir = dir;
            Items[iid].IID = real(iid);
            ItemsCount++;
            switch (itemType) {
            case oLaserGenerator:
                var x1 = xx;
                var y1 = yy;
                do {
                    var laser = instance_create(x1, y1, oLaser);
                    laser.Dir = dir;
                    Items[iid].Lasers[Items[iid].LasersCount] = laser;
                    Items[iid].LasersCount++;
                    ds_grid[#x1,y1] = 2;
                    x1 -= Dx(dir);
                    y1 -= Dy(dir);
                } until (oMap.Map[#x1,y1] == 1);
                break;
            case oElectroBlock:
                ds_grid[#xx,yy] = 2;
                break;
            }
        }
    }
}

// nets
while (file_text_eof(file) == false) {
    str = file_text_read_string(file);
    file_text_readln(file);
    args = split(str, ' ');
    var argsLength = array_length_1d(args);
    var itemFrom = Items[args[0]];
    for (var i = 1; i < argsLength; i++) {
        var itemTo = Items[args[i]];
        itemFrom.Outputs[itemFrom.OutputsCount] = itemTo;
        itemFrom.OutputsCount++;
        itemTo.Inputs[itemTo.InputsCount]  = itemFrom;
        itemTo.InputsCount++;
    }
}

file_text_close(file);

