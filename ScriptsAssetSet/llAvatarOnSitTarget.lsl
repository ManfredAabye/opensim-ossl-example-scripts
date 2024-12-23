/*
This script sets a sit target for the object and detects when an avatar sits on it. 
When an avatar sits, it says a message in local chat addressing the avatar by name.
*/

// This is an OpenSim script written in LSL (Linden Scripting Language)

// The default state of the script
default
{
    // The state_entry event is triggered when the script is initialized or reset
    state_entry()
    {
        // Set the sit target for the object
        // This is necessary for detecting when an avatar sits on the object
        llSitTarget(<0.0, 0.0, 0.1>, ZERO_ROTATION);
    }

    // The changed event is triggered when something changes in the object
    // 'change' is an integer indicating what changed
    changed(integer change)
    {
        // Check if the change is due to a link being touched or moved
        if (change & CHANGED_LINK)
        {
            // Get the key of the avatar sitting on the object
            key av = llAvatarOnSitTarget();

            // Check if the avatar key is valid (not NULL_KEY or invalid)
            if (av)
            {
                // Say a message in local chat addressing the avatar by name
                llSay(0, "Hello " + llKey2Name(av) + ", thank you for sitting down");
            }
        }
    }
}

