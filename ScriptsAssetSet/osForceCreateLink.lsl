/*
osForceCreateLink(key target, integer parent)
This function creates a link between the object containing the script and the target object.
*/

//
// osForceCreateLink Script Example
// Author: djphil
//

// Define the UUID of the object to be linked, parent link number, and a switch variable.
key target = "fbe8ad1b-b7bf-4919-b219-3ebf78e5f607";
integer parent = LINK_ROOT;
integer switch;

// The default state of the script.
default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Check if the provided UUID is valid.
        if (osIsUUID(target))
        {
            // If valid, notify users how to trigger the script.
            llSay(PUBLIC_CHANNEL, "Touch to see osForceCreateLink usage.");
        }
        else
        {
            // If invalid, notify users of the issue.
            llSay(PUBLIC_CHANNEL, "Invalid UUID detected ...");
        }
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer number)
    {
        // Toggle the switch to alternate between creating a link and breaking a link.
        if (switch = !switch)
        {
            // If switch is true, create a link between the object and the target object.
            osForceCreateLink(target, parent);
        }
        else
        {
            // If switch is false, break the link with link number 2 (example usage, can be adjusted).
            osForceBreakLink(2);
        }
    }

    // The changed event is triggered when a change occurs in the object's state.
    changed(integer change)
    {
        // Check if the change is related to link changes.
        if (change & CHANGED_LINK)
        {
            // If links have changed, notify users.
            llSay(PUBLIC_CHANNEL, "The number of links has changed.");
        }
    }
}
