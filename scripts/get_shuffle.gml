/// get_shuffle(size)

var a = argument0;

var result;
for (var i = 0; i < a; i++) {
    result[i] = i;
}
for (var i = 0; i < a; i++) {
    var j = rand(a - 1);
    if (j >= i) {
        j++;
    }
    var swap = result[i];
    result[i] = result[j];
    result[j] = swap;
}

return result;

