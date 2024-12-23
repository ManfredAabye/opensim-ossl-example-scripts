// Example for osGetLinkInventoryName
// This script uses the osGetLinkInventoryName function to get the name of an inventory item via the key and child prim number
 
// Define the child prim
integer CHILD_PRIM_NUMBER = 2;
// Define the key of the inventory item
key itemUUID = "INVENTORY_ITEM_KEY";
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the inventory item name via its key and the child prim number
        string itemName = osGetLinkInventoryName(CHILD_PRIM_NUMBER, itemUUID);
 
        // Check if the name is not empty
        if (itemName != "")
        {
            // Output the item name to owner chat
            llOwnerSay("Name of the inventory item with UUID " + (string)itemUUID + ": " + itemName);
        }
        else
        {
            // If the name is empty or the item is not found indicate as such
            llOwnerSay("The inventory item with UUID " + (string)itemUUID + " may be empty or not found");
        }
    }
}