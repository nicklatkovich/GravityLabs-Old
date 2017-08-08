/// activate_item(aItem)

var item = argument0;

var type = item.object_index;

switch (type) {
    case oButton:
        var dState;
        if (item.State == 0) {
            dState = 1;
        } else {
            dState = -1;
        }
        item.State += dState;
        for (var i = 0; i < item.OutputsCount; i++) {
            item.Outputs[i].Lock += dState;
        }
        with (oWayLamp) {
            if (Item == item) {
                visible = !visible;
            }
        }
        break;
    case oComp:
        if (item.Lock == item.InputsCount) {
            if (item.State > 0) {
                item.Outputs[item.State - 1].Lock--;
                with (oWayLamp) {
                    if (Item == item && OutputNumber == item.State - 1) {
                        visible = false;
                    }
                }
            }
            item.State = (item.State + 1) mod (item.OutputsCount + 1);
            if (item.State > 0) {
                item.Outputs[item.State - 1].Lock++;
                with (oWayLamp) {
                    if (Item == item && OutputNumber == item.State - 1) {
                        visible = true;
                    }
                }
            }
        }
        break;
}

