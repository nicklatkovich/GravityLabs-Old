/// add_net(from, to)

var itemFrom = argument0;
var itemTo = argument1;

itemFrom.Outputs[itemFrom.OutputsCount] = itemTo;
itemFrom.OutputsCount++;
itemTo.Inputs[itemTo.InputsCount]  = itemFrom;
itemTo.InputsCount++;


