/// get_puts_coords(aItem)

var item = argument0;

var result = undefined;

var xf, yf, xt, yt, drawWay = false;;
var xx8 = item.xx * 8;
var yy8 = item.yy * 8;
switch (item.object_index) {
    case oButton:
        switch (item.Dir) {
            case 0:
                xf = xx8 + 7;
                yf = yy8 + 3;
                xt = xx8 + 8;
                yt = yy8 + 4;
                drawWay = true;
                break;
            case 3:
                xf = xx8 + 3;
                yf = yy8 + 7;
                xt = xx8 + 4;
                yt = yy8 + 8;
                drawWay = true;
                break;
        }
        break;
    case oComp:
    case oElectroBlock:
        xf = xx8 + 3;
        yf = yy8 + 3;
        xt = xx8 + 4;
        yt = yy8 + 4;
        drawWay = true;
        break;
    case oLaserGenerator:
        switch (item.Dir) {
            case 0:
                xf = xx8 + 7;
                yf = yy8 + 0;
                xt = xx8 + 8;
                yt = yy8 + 7;
                drawWay = true;
                break;
            case 1:
                xf = xx8 + 0;
                yf = yy8 + -1;
                xt = xx8 + 7;
                yt = yy8 + 0;
                drawWay = true;
                break;
        }
        break;
}

if (drawWay) {
    result[0] = xf;
    result[1] = yf;
    result[2] = xt;
    result[3] = yt;
}

return result;

