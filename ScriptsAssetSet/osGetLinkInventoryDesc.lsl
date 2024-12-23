// Example for osGetLinkInventoryDesc
// This script uses the osGetLinkInventoryDesc function to get the description of a specified inventory item
// It looks for the item via key or name in the specified linked prim
 
// Define the link number in which to look
integer CHILD_PRIM_NUMBER = 2;
// Define the inventory name or key
string itemNameOrID = "INVENTORY_KEY_OR_NAME";
 
// Event handler, that is executed on script start
default
{
    state_entry()
    {
        // Get the description of the specified item from the linked prim
        string itemDescription = osGetLinkInventoryDesc(CHILD_PRIM_NUMBER, itemNameOrID);
 
        // Check if the description is not empty
        if (itemDescription != "")
        {
            // Output to owner chat channel
            llOwnerSay("Description reads: " + itemDescription);
        }
        else
        {
            // Notify if the description is empty or the item is missing entirely
            llOwnerSay("Description empty or item not found");
        }
    }
}