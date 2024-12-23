/*
osDie(key objectID)
    The provided script demonstrates the usage of the osDie() function, which deletes an object depending on the target UUID.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. 
    It checks if the object to be rezzed exists in the inventory and notifies in public chat accordingly.

    The touch_start() event handler is triggered when the object is touched. 
    It toggles between rezzing and deleting the object based on the value of the switch variable. If the object is rezzed, it uses llRezObject() to rez the object. 
    If the object is to be deleted, it uses osDie() function to delete the object.

    The object_rez() event handler is triggered when the object is rezzed. It stores the UUID of the rezzed object in the objectID variable.
*/

//
// osDie Script Example
// Author: djphil
//

key objectID;   // Variable to store the UUID of the rezzed object
integer switch; // Variable to toggle between rezzing and deleting the object

default
{
    state_entry()
    {
        // Check if the object to be rezzed exists in the inventory
        if (llGetInventoryNumber(INVENTORY_OBJECT))
        {
            // If yes, notify in public chat to touch the object to see osDie usage
            llSay(PUBLIC_CHANNEL, "Touch to see osDie usage.");
        }
        else
        {
            // If no, notify in public chat about the missing inventory object
            llSay(PUBLIC_CHANNEL, "Inventory object missing ...");
        }
    }

    touch_start(integer number)
    {
        // Toggle between rezzing and deleting the object
        if (switch =! switch)
        {
            // If switch is true, rezz the object
            llRezObject("Object", llGetPos() + <0.0, 0.0, 1.0>, ZERO_VECTOR, ZERO_ROTATION, 0);
        }
        else
        {
            // If switch is false, delete the object using osDie function
            osDie(objectID);
        }
    }

    object_rez(key uuid)
    {
        // Store the UUID of the rezzed object
        objectID = uuid;
    }
}
