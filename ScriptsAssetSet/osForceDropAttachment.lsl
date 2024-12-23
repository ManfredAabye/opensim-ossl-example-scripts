/*
osForceDropAttachment()
This function drops the attached object on the ground in front of the avatar.
*/

//
// osForceDropAttachment Script Example (YEngine)
// Author: djphil
//

// The default state of the script.
default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Notify users how to trigger the attachment and dropping.
        llSay(PUBLIC_CHANNEL, "Touch to see osForceAttachToAvatar attach this object to your avatar's left hand.");
        llSay(PUBLIC_CHANNEL, "Touch it again to see osForceDropAttachment drop this object on the ground in front of your avatar.");
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer number)
    {
        // Check if the object is not currently attached.
        if (!llGetAttached())
        {
            // If not attached, attach the object to the avatar's left hand.
            osForceAttachToAvatar(ATTACH_LHAND);
        }
        else if (llGetAttached())
        {
            // If attached, drop the object on the ground in front of the avatar.
            osForceDropAttachment();
        }
    }

    // The attach event is triggered when the object is attached to or detached from an avatar.
    attach(key id)
    {
        // Test if the attachment is successful (id contains a valid key).
        if (id)
        {
            // If successful, send a message to the owner indicating the attachment.
            llOwnerSay("The object is attached to " + llKey2Name(id));
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
        // Reset the script if it's not attached.
        if (!llGetAttached())        
        {
            llResetScript();
        }
    }
}
