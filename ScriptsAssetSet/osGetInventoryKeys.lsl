// Example for osGetInventoryKeys
// This script uses the osGetInventoryKeys function to return a list of keys based on inventory type
 
// Define the inventory type
integer INVENTORY_TYPE = INVENTORY_ALL;
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the list of keys
        list itemUUIDs = osGetInventoryKeys(INVENTORY_TYPE);
 
        // Check if the list contains items
        if (llGetListLength(itemUUIDs) > 0)
        {
            // Go through the list and output it to owner chat
            integer numItems = llGetListLength(itemUUIDs);
            string uuidList = "UUIDs of the inventory items:\n";
            integer i;
            for (i = 0; i < numItems; ++i)
            {
                string itemUUID = llList2String(itemUUIDs, i);
                uuidList += itemUUID + "\n";
            }
            llOwnerSay(uuidList);
        }
        else
        {
            // If the list is empty indicate as such
            llOwnerSay("Inventory is empty or not items of inventory type were found");
        }
    }
}