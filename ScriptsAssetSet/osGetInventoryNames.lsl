// Example for osGetInventoryNames
// This script uses the function osGetInventoryNames to return a list of inventory items by name
// based on the inventory type (INVENTORY_ALL)
// The found item names are output to owner chat
 
// Define the inventory type constant
integer INVENTORY_TYPE = INVENTORY_ALL;
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Use osGetInventoryNames to fetch the list of inventory items by name
        list inventoryList = osGetInventoryNames(INVENTORY_TYPE);
 
        // Check if the list is empty
        if (llGetListLength(inventoryList) > 0)
        {
            // Go through the list and output each item to chat
            integer numItems = llGetListLength(inventoryList);
            string itemNames = "Inventory item(s):\n";
            integer i;
            for (i = 0; i < numItems; ++i)
            {
                string itemName = llList2String(inventoryList, i);
                itemNames += itemName + "\n";
            }
            llOwnerSay(itemNames);
        }
        else
        {
            // If the list is empty give indication as such
            llOwnerSay("Inventory is empty.");
        }
    }
}