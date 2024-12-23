/*
osSetSitActiveRange(float range)
This script ensures that avatars sit at a specific position with a specified rotation within the virtual environment. 
It also monitors changes in avatar sitting status and provides debug information accordingly. 
Additionally, it sets an active range for avatar sitting, which can be useful for certain interactions within the virtual environment.
*/

// Example of osSetSitActiveRange
 
vector target = <0.0, 0.3, 0.55>; // Defines the position where avatars will sit
vector rotate = <0.0, 0.0, 90.0>; // Defines the rotation of the seated avatars
float active_range = 5.0; // Specifies the range within which avatars are considered active
key avatar; // Stores the key of the currently seated avatar

// Function to output debug messages
debug(string name)
{
    active_range = osGetSitActiveRange(); // Updates the active range
    llOwnerSay("active_range for avatar " + name + " is " + (string)active_range); // Outputs debug message
}

default
{
    state_entry()
    {
        llUnSit(llAvatarOnSitTarget()); // Ensures no avatar is currently seated
        llSetClickAction(CLICK_ACTION_SIT); // Sets click action to trigger sitting behavior
        llSitTarget(target, llEuler2Rot((rotate * DEG_TO_RAD))); // Sets the sitting target position and rotation
        osSetSitActiveRange(active_range); // Sets the active range for avatar sitting
    }

    changed(integer change)
    {
        if (change & CHANGED_LINK) // Checks if there's a change in links (i.e., avatar sitting)
        {
            key user = llAvatarOnSitTarget(); // Gets the key of the avatar sitting on the target

            if (user != NULL_KEY) // If an avatar is sitting on the target
            {
                avatar = user; // Stores the key of the seated avatar
                debug(osKey2Name(avatar)); // Outputs debug message with the name of the seated avatar
            }
            else if (user == NULL_KEY) // If no avatar is sitting on the target
            {
                debug(osKey2Name(avatar)); // Outputs debug message with the name of the previously seated avatar
                avatar = NULL_KEY; // Resets the stored avatar key
            }
            else // If an unexpected situation occurs
            {
                llResetScript(); // Resets the script
            }
        }
    }
}
