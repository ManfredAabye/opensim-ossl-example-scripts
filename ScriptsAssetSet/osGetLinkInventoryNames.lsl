// Example for osGetLinkInventoryNames
// This script uses the osGetLinkInventoryNames function to return a list of inventory items of a specified type in a specified child prim
 
// Define the child prim
integer CHILD_PRIM_NUMBER = 2;
// Define the inventory type
integer INVENTORY_TYPE = INVENTORY_ALL;
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the list of inventory items by name
        list inventoryNames = osGetLinkInventoryNames(CHILD_PRIM_NUMBER, INVENTORY_TYPE);
 
        // Check if the list contains items
        if (llGetListLength(inventoryNames) > 0)
        {
            // Go through the list and output the names to owner chat
            integer numItems = llGetListLength(inventoryNames);
            string itemNames = "Inventory items:\n";
            integer i;
            for (i = 0; i < numItems; ++i)
            {
                string itemName = llList2String(inventoryNames, i);
                itemNames += itemName + "\n";
            }
            llOwnerSay(itemNames);
        }
        else
        {
            // If nothing is found indicate as such
            llOwnerSay("The inventory of the child prim is empty or does not contains items of this inventory type");
        }
    }
}