/*
key osGetInventoryItemKey(string name)
This function retrieves the key of the inventory item with the specified name.
*/

//
// osGetInventoryItemKey Script Example
// Author: Ubit
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Display a message prompting to touch the object to see osGetInventoryItemKey usage.
        llSay(PUBLIC_CHANNEL, "Touch me to see osGetInventoryItemKey usage.");
    }

    // The touch_start event is triggered when an object is touched.
    touch_start(integer number)
    {
        // Retrieve the key of the inventory item named "MyItemName" using osGetInventoryItemKey().
        key ItemKey = osGetInventoryItemKey("MyItemName");

        // Check if the item key is not NULL_KEY (i.e., the item exists).
        if (ItemKey != NULL_KEY)
        {
            // Retrieve the description of the item using osGetInventoryDesc().
            string itemDesc = osGetInventoryDesc((string)ItemKey);

            // Display the key and description of the item.
            llSay(PUBLIC_CHANNEL, "Item key is " + (string)ItemKey);
            llSay(PUBLIC_CHANNEL, "Item description is " + itemDesc);
        }
        else
        {
            // Display a message indicating that the item key is NULL_KEY or the item was not found.
            llSay(PUBLIC_CHANNEL, "The item key is a NULL_KEY, item not found, or owner has no rights ...");
        }
    }
}
