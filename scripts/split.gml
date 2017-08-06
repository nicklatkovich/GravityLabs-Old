/// split(string, splitChar)

var str = argument0;
var sub = argument1;

var result = undefined;
var resultLength = 0;

var st = 1;
var i;
for (i = 1; i <= string_length(str); i++) {
    if (string_char_at(str, i) == sub) {
        result[resultLength] = string_copy(str, st, i - st);
        resultLength++;
        st = i + 1;
    }
}
result[resultLength] = string_copy(str, st, i - st);
resultLength++;

return result;

