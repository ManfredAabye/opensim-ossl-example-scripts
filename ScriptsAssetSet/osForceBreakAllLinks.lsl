/*
osForceBreakAllLinks()
This function breaks all links between objects in the same linkset.
*/

//
// osForceBreakAllLinks Script Example
// Author: djphil
//

// Define the UUIDs of the objects to be linked and the parent link number.
key target_a = "fbe8ad1b-b7bf-4919-b219-3ebf78e5f607";
key target_b = "07377b80-0484-4818-9e11-3397e48a32f4";
integer parent = LINK_ROOT;

// Variable to toggle between creating links and breaking all links.
integer switch;

// The default state of the script.
default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Check if the provided UUIDs are valid.
        if (osIsUUID(target_a) && osIsUUID(target_b))
        {
            // If valid, notify users how to trigger the script.
            llSay(PUBLIC_CHANNEL, "Touch to see osForceBreakAllLinks usage.");
        }
        else
        {
            // If invalid, notify users of the issue.
            llSay(PUBLIC_CHANNEL, "Invalid UUID(s) detected ...");
        }
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer number)
    {
        // Toggle the switch to alternate between creating links and breaking all links.
        if (switch = !switch)
        {
            // If switch is true, create links between the objects and the parent.
            osForceCreateLink(target_a, parent);
            osForceCreateLink(target_b, parent);
        }
        else
        {
            // If switch is false, break all links in the linkset.
            osForceBreakAllLinks();
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
