/*
This script allows the owner to toggle the permission for allowing or disallowing inventory dropping on the object. 
When touched, it toggles the allow variable and allows or disallows inventory dropping accordingly using llAllowInventoryDrop function. 
It also notifies the owner about the current state of the inventory dropping permission. Additionally, it detects changes in object state, 
specifically changes related to inventory dropping permission (CHANGED_ALLOWED_DROP), 
and notifies the owner about any changes made by users without mod permissions dropping items on the object.
*/

// Declare a variable to control whether inventory dropping is allowed
integer allow;

// Define the default state
default
{
    // Event handler for touch start
    touch_start(integer num)
    {
        // Toggle the allow variable and allow/disallow inventory dropping accordingly
        llAllowInventoryDrop(allow = !allow);

        // Notify the owner about the current state of inventory dropping permission
        llOwnerSay("llAllowInventoryDrop == " + llList2String(["FALSE", "TRUE"], allow));
    }

    // Event handler for changes in object state
    changed(integer change)
    {
        // Check if the inventory drop permission has changed
        if (change & CHANGED_ALLOWED_DROP) // Note: It's bitwise operation, not logical AND (&&)
        {
            // Notify the owner about the change in inventory as a result of a user dropping an item
            llOwnerSay("The inventory has changed as a result of a user without mod permissions dropping an item on the prim and it being allowed by the script.");
        }
    }
}
