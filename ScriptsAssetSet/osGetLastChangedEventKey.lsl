/*
key osGetLastChangedEventKey()
This function retrieves the key of the last object involved in the most recent inventory change event.
*/

//
// osGetLastChangedEventKey Script Example
// Author: Ubit
//

default
{
    // The state_entry event is triggered when the script starts running.
    state_entry()
    {
        // Display a message instructing to drop an item into the object's inventory to see osGetLastChangedEventKey usage.
        llSay(PUBLIC_CHANNEL, "Drop an item into this primitive's inventory to see osGetLastChangedEventKey usage.");
        // Allow objects to be dropped into the inventory.
        llAllowInventoryDrop(TRUE);
    }

    // The changed event is triggered when there is a change in the object's properties or status.
    changed(integer change)
    {
        // Check if the inventory has changed.
        if (change & CHANGED_INVENTORY)
        {
            // Display a message indicating that the inventory has changed.
            llSay(PUBLIC_CHANNEL, "The inventory has changed ...");
        }

        // Check if the object's allowed drop status has changed.
        if (change & CHANGED_ALLOWED_DROP)
        {
            // Display a message indicating that an item has been dropped into the inventory.
            llSay(PUBLIC_CHANNEL, "An item has been dropped into this primitive's inventory");

            // Retrieve the key of the last object involved in the most recent inventory change event.
            key id = osGetLastChangedEventKey();

            // Check if the key is not empty.
            if (id != "")
            {
                // Retrieve the last owner of the dropped item.
                key who = osGetInventoryLastOwner(id);
                // Display information about the dropped item.
                llSay(PUBLIC_CHANNEL, "Inventory item ID: " + (string)id);
                llSay(PUBLIC_CHANNEL, "Item dropped by: " + (string)who + " (" + llKey2Name(who) + ")");
                llSay(PUBLIC_CHANNEL, "Item name: " + osGetInventoryName(id));
                llSay(PUBLIC_CHANNEL, "Item description: " + osGetInventoryDesc(id));
            }
            else
            {
                // Display a message indicating that the item ID is empty.
                llSay(PUBLIC_CHANNEL, "The item ID is empty ...");
            }
        }
    }
}
