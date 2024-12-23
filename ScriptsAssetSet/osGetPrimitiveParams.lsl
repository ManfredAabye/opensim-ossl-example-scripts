/*
list osGetPrimitiveParams(key primId, list rules)
When an avatar touches the object containing this script, it will output a message in the chat channel prompting to see the usage of osGetPrimitiveParams. 
Upon touching the object, it will then retrieve the specified parameters of the prim identified by the UUID target_uuid and output these parameters to the chat. 
Please make sure to replace target_uuid with the UUID of the prim you wish to get parameters from.
*/

// osGetPrimitiveParams Script Exemple
 
// Change target_uuid to any uuid of the prim you wish to get params.
string target_uuid = "44d375e6-c42b-49ad-b01d-663309350511";

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osGetPrimitiveParams usage.");
    }

    touch_start(integer number)
    {
        // Get various parameters of the prim based on its UUID
        list buffer = osGetPrimitiveParams(target_uuid, [PRIM_NAME, PRIM_SIZE, PRIM_POSITION, PRIM_ROTATION]);

        // Output the retrieved parameters to the chat
        llSay(PUBLIC_CHANNEL, "[PRIM_NAME] " + llList2String(buffer, 0));
        llSay(PUBLIC_CHANNEL, "[PRIM_SIZE] " + llList2String(buffer, 1));
        llSay(PUBLIC_CHANNEL, "[PRIM_POSITION] " + llList2String(buffer, 2));
        llSay(PUBLIC_CHANNEL, "[PRIM_ROTATION] " + llList2String(buffer, 3));
    }
}
