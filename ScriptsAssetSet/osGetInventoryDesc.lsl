/*
string osGetInventoryDesc(string itemName_or_itemId)
This function retrieves the description of the specified inventory item.
*/

//
// osGetInventoryDesc Script Example
// Author: Gudule Lapointe
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Check if there is at least one landmark in the inventory.
        if (llGetInventoryNumber(INVENTORY_LANDMARK))
        {
            // Display a message prompting to touch the object to see osGetInventoryDesc usage.
            llSay(PUBLIC_CHANNEL, "Touch to see osGetInventoryDesc usage.");
        }
        else
        {
            // Display a message indicating that the inventory landmark is missing.
            llSay(PUBLIC_CHANNEL, "Inventory landmark missing ...");
        }
    }

    // The touch_start event is triggered when an object is touched.
    touch_start(integer number)
    {
        // Retrieve the name of the first landmark in the inventory.
        string inventory_name = llGetInventoryName(INVENTORY_LANDMARK, 0);

        // Retrieve the description of the landmark using osGetInventoryDesc().
        string inventory_desc = osGetInventoryDesc(inventory_name);

        // Display the name and description of the landmark.
        llSay(PUBLIC_CHANNEL, "inventory_name: " + inventory_name);
        llSay(PUBLIC_CHANNEL, "inventory_desc: " + inventory_desc);
    }
}
