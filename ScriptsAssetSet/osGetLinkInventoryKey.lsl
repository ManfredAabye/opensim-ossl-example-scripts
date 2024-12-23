// Example for osGetLinkInventoryKey
// This script uses the osGetLinkInventoryKey function to fetch the key of a specified inventory item in a specified child prim
 
// Define the child prim
integer CHILD_PRIM_NUMBER = 2;
// Define the inventory item name
string itemName = "INVENTORY_ITEM_NAME";
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the key of the inventory item by name in child prim
        key itemUUID = osGetLinkInventoryKey(CHILD_PRIM_NUMBER, itemName);
 
        // Check if the returned key is not NULL_KEY
        if (itemUUID != NULL_KEY)
        {
            // Output the key to owner chat
            llOwnerSay("UUID of the inventory item '" + itemName + "': " + (string)itemUUID);
        }
        else
        {
            // If the key is NULL_KEY then the item was not found
            llOwnerSay("No inventory item named '" + itemName + "' was found");
        }
    }
}