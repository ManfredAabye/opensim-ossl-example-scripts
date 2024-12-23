/*
key osGetInventoryLastOwner(string itemName_or_itemId)
This function retrieves the key of the last owner of the specified inventory item.
*/

//
// osGetInventoryLastOwner Script Example
// Author: Ubit
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Display a message instructing to drop an item to see osGetInventoryLastOwner usage.
        llSay(PUBLIC_CHANNEL, "Drop an item to this primitive's inventory to see osGetInventoryLastOwner usage.");
        
        // Allow objects to be dropped into this primitive's inventory.
        llAllowInventoryDrop(TRUE);
    }

    // The changed event is triggered when a change occurs, such as an item being dropped into the inventory.
    changed(integer change)
    {
        // Check if the inventory has changed.
        if (change & CHANGED_INVENTORY)
        {
            // Display a message indicating that the inventory has changed.
            llSay(PUBLIC_CHANNEL, "The inventory has changed ...");
        }

        // Check if items are allowed to be dropped into the inventory.
        if (change & CHANGED_ALLOWED_DROP)
        {
            // Display a message indicating that an item has been dropped into the inventory.
            llSay(PUBLIC_CHANNEL, "An item has been dropped in this primitive's inventory");

            // Retrieve the key of the last event that caused a change.
            key id = osGetLastChangedEventKey();

            // Check if the key is not empty.
            if (id != "")
            {
                // Retrieve the key of the last owner of the dropped item using osGetInventoryLastOwner().
                key who = osGetInventoryLastOwner(id);

                // Display information about the dropped item and its last owner.
                llSay(PUBLIC_CHANNEL, "I got inventory dropped item " + (string)id);
                llSay(PUBLIC_CHANNEL, "Item dropped by " + (string)who + " (" + llKey2Name(who) + ")");
                llSay(PUBLIC_CHANNEL, "The item name is " + osGetInventoryName(id));
                llSay(PUBLIC_CHANNEL, "The item description is " + osGetInventoryDesc(id));
            }
            else
            {
                // Display a message indicating that the item key is empty.
                llSay(PUBLIC_CHANNEL, "This item id is empty ...");
            }
        }
    }
}
