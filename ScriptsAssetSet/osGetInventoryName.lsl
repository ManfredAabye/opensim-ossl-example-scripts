/*
string osGetInventoryName(key itemId)
This function retrieves the name of the inventory item associated with the specified item ID.
*/

//
// osGetInventoryName Script Example
// Author: Gudule Lapointe
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Check if the primitive has at least one landmark in its inventory.
        if (llGetInventoryNumber(INVENTORY_LANDMARK))
        {
            // Display a message prompting to touch the object to see osGetInventoryName usage.
            llSay(PUBLIC_CHANNEL, "Touch to see osGetInventoryName usage.");
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
        // Retrieve the name of the first landmark in the primitive's inventory using osGetInventoryName().
        key itemId = llGetInventoryKey(llGetInventoryName(INVENTORY_LANDMARK, 0));
        string itemName = osGetInventoryName(itemId);

        // Retrieve the description of the item using osGetInventoryDesc().
        string itemDesc = osGetInventoryDesc(itemName);

        // Display the name and description of the inventory item.
        llSay(PUBLIC_CHANNEL, "Inventory item name: " + itemName);
        llSay(PUBLIC_CHANNEL, "Inventory item description: " + itemDesc);
    }
}
