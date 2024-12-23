/*
osForceAttachToOtherAvatarFromInventory(string rawAvatarId, string itemName, integer attachmentPoint)
This function attempts to attach an object from the script's inventory to another avatar at a specified attachment point.
*/

//
// osForceAttachToOtherAvatarFromInventory Script Example (YEngine)
// Author: djphil
//

// Declare variables to store the target avatar UUID and the name of the object to be attached.
string AvatarUuid = "<TARGET_AVATAR_UUID>";
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
        // Check if the target avatar UUID is invalid or not provided.
        else if (AvatarUuid == "<USER_UUID_TO_EJECT>" || !osIsUUID(AvatarUuid))
        {
            // Send a message to the owner to replace the target avatar UUID with a valid one.
            llOwnerSay("Please replace <TARGET_AVATAR_UUID> with a valid user UUID");
        }
        else
        {
            // If the inventory is not empty and the target avatar UUID is valid, send messages to the public chat channel with information about the object and target avatar.
            llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToOtherAvatarFromInventory attach the object to the target avatar's left hand.");
            llSay(PUBLIC_CHANNEL, "Object name is " + ObjectName + " and target avatar UUID is " + AvatarUuid + " (" + osKey2Name(AvatarUuid) + ")");
        }
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer number)
    {
        // Attempt to attach the object to the target avatar's left hand.
        osForceAttachToOtherAvatarFromInventory(AvatarUuid, ObjectName, ATTACH_LHAND);
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
