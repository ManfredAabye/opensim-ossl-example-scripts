/*
float osGetSitActiveRange()
This script sets up a sit target for avatars on an object in an OpenSim environment. 
It also handles changes in the sit state of avatars and provides debugging information about the active sit range and the avatar interacting with the object.
*/

// Example of osGetSitActiveRange
 
// Define a target position where avatars will sit
vector target = <0.0, 0.3, 0.55>;

// Define rotation for the sitting avatar
vector rotate = <0.0, 0.0, 90.0>;

// Define the range within which avatars can activate the sit action
float active_range = 5.0;

// Store the key of the sitting avatar
key avatar;

// Function to display debugging information
debug(string name)
{
    // Get the current active sit range
    active_range = osGetSitActiveRange();
    
    // Output the active sit range for the given avatar
    llOwnerSay("active_range for avatar " + name + " is " + (string)active_range);
}

// Default event handler
default
{
    state_entry()
    {
        // Make sure there's no one sitting on the object before setting up
        llUnSit(llAvatarOnSitTarget());
        
        // Set the object to react to clicks by allowing avatars to sit
        llSetClickAction(CLICK_ACTION_SIT);
        
        // Set the sit target position and rotation for avatars
        llSitTarget(target, llEuler2Rot((rotate * DEG_TO_RAD)));
        
        // Set the active sit range for the object
        osSetSitActiveRange(active_range);
    }
 
    changed(integer change)
    {
        // Check if there's a change in the link (e.g., an avatar sitting or standing)
        if (change & CHANGED_LINK)
        {
            // Get the key of the avatar sitting on the object
            key user = llAvatarOnSitTarget();
 
            // If an avatar is sitting
            if (user != NULL_KEY)
            {
                // Store the key of the avatar
                avatar = user;
                
                // Display debugging information for the sitting avatar
                debug(osKey2Name(avatar));
            }
            // If no avatar is sitting
            else if (user == NULL_KEY)
            {
                // Display debugging information indicating no avatar is sitting
                debug(osKey2Name(avatar));
                
                // Reset the stored avatar key
                avatar = NULL_KEY;
            }
            // If an unexpected condition occurs
            else
            {
                // Reset the script
                llResetScript();
            }
        }
    }
}
