/*
osForceAttachToAvatarFromInventory(string itemName, integer attachmentPoint)
This function attempts to attach an object from the script's inventory to an avatar at a specified attachment point.
*/

//
// osForceAttachToAvatarFromInventory Script Example (YEngine)
// Author: djphil
//

// Declare a variable to store the name of the object to be attached.
string ObjectName;

// The default state of the script.
default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Get the name of the first inventory item in the script's inventory.
        ObjectName = llGetInventoryName(INVENTORY_ALL, 0);

        // Check if the inventory is empty.
        if (ObjectName == "")
        {
            // If the inventory is empty, send a message to the public chat channel.
            llSay(PUBLIC_CHANNEL, "Inventory object missing ...");
        }
        else
        {
            // If the inventory is not empty, send a message to the public chat channel indicating how to trigger the attachment.
            llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToAvatarFromInventory attach the object " + ObjectName + " to your avatar's left hand.");
        }
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer number)
    {
        // Attempt to attach the object to the avatar's left hand.
        osForceAttachToAvatarFromInventory(ObjectName, ATTACH_LHAND);
    }

    // The attach event is triggered when the object is attached to or detached from an avatar.
    attach(key id)
    {
        // Check if the attachment is successful (id contains a valid key).
        if (id)
        {
            // If successful, send a message to the owner indicating the attachment.
            llOwnerSay("The object " + ObjectName + " is attached to " + llKey2Name(id));
        }
        else
        {
            // If not successful, send a message to the owner indicating that the object is not attached.
            llOwnerSay("The object is not attached!");
        }
    }

    // The on_rez event is triggered when the object is rezzed (created in-world).
    on_rez(integer param)
    {
        // Reset the script if it's not attached to an avatar.
        if (!llGetAttached())
        {
            llResetScript();
        }
    }
}
