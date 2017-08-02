/// oPlayerInit(oMap, xx, yy)

var map = argument0;
var xx = argument1;
var yy = argument2;

var result = instance_create((xx + 0.5) * map.CellSize, (yy + 0.5) * map.CellSize, oPlayer);
result.xx = xx;
result.yy = yy;
result.Map = map;

