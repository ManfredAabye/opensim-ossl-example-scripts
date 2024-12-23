/*
osSetStandTarget(vector feetTarget)
This script manages avatar sitting behavior and also sets a stand target position for avatars. 
It ensures that avatars sit at a specific position with a specified rotation and have a designated position to stand up to when they're not seated. 
Additionally, it monitors changes in avatar sitting status and provides debug information accordingly.
*/

// Example of osSetStandTarget
 
vector target = <0.0, 0.3, 0.55>; // Defines the position where avatars will sit
vector rotate = <0.0, 0.0, 90.0>; // Defines the rotation of the seated avatars
vector stand_target = <1.0, -1.0, 1.0>; // Defines the stand target position for avatars
key avatar; // Stores the key of the currently seated avatar

// Function to output debug messages
debug(string name)
{
    stand_target = osGetStandTarget(); // Retrieves the stand target position
    llOwnerSay("stand_target for avatar " + name + " is " + (string)stand_target); // Outputs debug message
}

default
{
    state_entry()
    {
        llUnSit(llAvatarOnSitTarget()); // Ensures no avatar is currently seated
        llSetClickAction(CLICK_ACTION_SIT); // Sets click action to trigger sitting behavior
        llSitTarget(target, llEuler2Rot((rotate * DEG_TO_RAD))); // Sets the sitting target position and rotation
        osSetStandTarget(stand_target); // Sets the stand target position for avatars
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
