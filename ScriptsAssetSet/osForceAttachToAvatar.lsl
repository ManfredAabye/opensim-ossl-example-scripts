/*
osForceAttachToAvatar(integer attachmentPoint)
    This script demonstrates the usage of the osForceAttachToAvatar(integer attachmentPoint) function, which forcefully attaches the object to the specified attachment point on the avatar.

    The script starts with a comment block describing the purpose of the function and the script's author.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. It checks if the object is not already attached, and if not, it forcefully attaches the object to the left hand of the avatar using osForceAttachToAvatar(ATTACH_LHAND).

    The attach() event handler is called when the object is attached or detached from an avatar. It checks if the provided id is valid (valid only when attached) and notifies the owner about the attachment.

    The on_rez() event handler is called when the object is rezzed (created). If the object is not attached, it resets the script using llResetScript().
*/

//
// osForceAttachToAvatar Script Example (YEngine)
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt users to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToAvatar attach this object to your avatar's left hand.");
    }

    touch_start(integer number)
    {
        // Check if the object is not already attached
        if (!llGetAttached())
        {
            // If not attached, force attach to the left hand of the avatar
            osForceAttachToAvatar(ATTACH_LHAND);
        }
    }

    // The attach event is called on both attach and detach.
    attach(key id)
    {
        // Test if 'id' is a valid key (valid only on attach)
        if (id)
        {
            // Notify the owner about the attachment
            llOwnerSay("The object is attached to " + llKey2Name(id));
        }
        else 
        {
            // Notify the owner if the object is not attached
            llOwnerSay("The object is not attached!");
        }
    }

    on_rez(integer param)
    {
        // Reset the script if the object is not attached
        if (!llGetAttached())        
        {
            llResetScript();
        }
    }
}
