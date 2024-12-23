/*
osForceDropAttachmentAt(vector pos, rotation rot)
    The provided script demonstrates the usage of the osForceDropAttachmentAt(vector pos, rotation rot) function, which forces the object to be dropped from the avatar's attachment point at a specific position and rotation.

    It starts with a comment block describing the function's purpose and the script's author.

    It declares two variables pos and rot to store the original position and rotation of the object.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It initializes the pos and rot variables and prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. It checks if the object is currently attached. If not attached, it forces attachment to the avatar's left hand using osForceAttachToAvatar(ATTACH_LHAND). 
    If attached, it forces dropping the attachment at the original position and rotation using osForceDropAttachmentAt(pos, rot).

    The attach() event handler is triggered when the object is attached or detached. It informs the owner about the attachment status.

    The on_rez() event handler is triggered when the object is rezzed in-world. It resets the script if the object is not attached, ensuring correct behavior when rezzed.
*/

//
// osForceDropAttachmentAt Script Example (YEngine)
// Author: djphil
//

vector pos;        // Variable to store the original position
rotation rot;      // Variable to store the original rotation

default
{
    state_entry()
    {
        // Get the current position and rotation of the object
        pos = llGetPos();
        rot = llGetRot();

        // Prompt users to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToAvatar attach this object to your avatar's left hand.");
        llSay(PUBLIC_CHANNEL, "Touch it again to see osForceDropAttachmentAt drop this object to its original position and rotation.");
        llSay(PUBLIC_CHANNEL, "The position is " + (string)pos + " and the rotation is " + (string)rot);
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
            // If attached, force drop the attachment at the original position and rotation
            osForceDropAttachmentAt(pos, rot);
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
