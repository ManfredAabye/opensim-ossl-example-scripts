/*
osForceDropAttachment()
    The provided script demonstrates the usage of the osForceDropAttachment() function, which forces the object to be dropped from the avatar's attachment point.

    It starts with a comment block describing the function's purpose and the script's author.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. It checks if the object is currently attached. If not attached, it forces attachment to the avatar's left hand using osForceAttachToAvatar(ATTACH_LHAND). 
    If attached, it forces dropping the attachment using osForceDropAttachment().

    The attach() event handler is triggered when the object is attached or detached. It informs the owner about the attachment status.

    The on_rez() event handler is triggered when the object is rezzed in-world. It resets the script if the object is not attached, ensuring correct behavior when rezzed.
*/

//
// osForceDropAttachment Script Example (YEngine)
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToAvatar attach this object to your avatar's left hand.");
        llSay(PUBLIC_CHANNEL, "Touch it again to see osForceDropAttachment drop this object on the ground in front of your avatar.");
    }

    touch_start(integer number)
    {
        // Check if the object is currently attached
        if (!llGetAttached())
        {
            // If not attached, force attach to avatar's left hand
            osForceAttachToAvatar(ATTACH_LHAND);
        }
        else
        {
            // If attached, force drop the attachment
            osForceDropAttachment();
        }
    }

    // The attach event is called on both attach and detach.
    attach(key id)
    {
        // Test if id is a valid key (id is only valid on attach)
        if (id)
        {
            // If attached, inform the owner about the attachment
            llOwnerSay("The object is attached to " + llKey2Name(id));
        }
        else
        {
            // If not attached, inform the owner that the object is not attached
            llOwnerSay("The object is not attached!");
        }
    }

    on_rez(integer param)
    {
        // Reset the script if it's not attached
        if (!llGetAttached())
        {
            llResetScript();
        }
    }
}
