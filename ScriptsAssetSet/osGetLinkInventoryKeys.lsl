// Example for osGetLinkInventoryKeys
// This script uses the osGetLinkInvenotryKeys function to return a list of inventory items from a given child prim
 
// Define the child prim
integer CHILD_PRIM_NUMBER = 2;
// Define the inventory type to fetch a list of
integer INVENTORY_TYPE = INVENTORY_ALL;
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the list of keys for the inventory items of the child prim
        list itemUUIDs = osGetLinkInventoryKeys(CHILD_PRIM_NUMBER, INVENTORY_TYPE);
 
        // Check if the list contains items
        if (llGetListLength(itemUUIDs) > 0)
        {
            // Go through the list and output it to owner chat
            integer numItems = llGetListLength(itemUUIDs);
            string uuidList = "Inventory UUIDs:\n";
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
            // If there are not returns indicate as such
            llOwnerSay("There are no items of that inventory type in the child prim");
        }
    }
}