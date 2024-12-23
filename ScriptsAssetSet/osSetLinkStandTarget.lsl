/*
osSetLinkStandTarget(integer linkNumber, vector feetTarget)
    In the state_entry() event, the script initializes by unsitting any avatars currently on the prim, sets the click action to allow sitting on the prim, sets the sit target position and rotation for the linked prim, and sets the stand target position for the linked prim.
    In the changed() event, the script detects changes in the linked prim. If an avatar sits on the prim, it updates the avatar variable with the avatar's key and calls the debug() function to display the stand target for the sitting avatar. If no avatar is sitting on the prim, it updates the avatar variable to NULL_KEY and calls the debug() function. If an unexpected condition occurs, the script is reset.
    The debug() function retrieves and displays the stand target for an avatar, using the osGetLinkStandTarget() function.
*/

// Example of osSetLinkStandTarget
 
vector target = <0.0, 0.3, 0.55>;      // Target position where avatars will sit
vector rotate = <0.0, 0.0, 90.0>;       // Rotation of the sitting avatar
vector stand_link_target = <1.0, -1.0, 1.0>;  // Stand target position when avatar stands
integer link = 2;                      // Link number of the prim
key avatar;                            // Key of the avatar currently sitting

// Function to debug and display stand target for an avatar
debug(string name)
{
    stand_link_target = osGetLinkStandTarget(link);
    llOwnerSay("stand_link_target for avatar " + name + " is " + (string)stand_link_target);
}

default
{
    state_entry()
    {
        // Stand up any avatars currently sitting on the prim
        llUnSit(llAvatarOnSitTarget());
        
        // Set click action to allow sitting on the prim
        llSetClickAction(CLICK_ACTION_SIT);
        
        // Set the sit target and rotation for the linked prim
        llLinkSitTarget(link, target, llEuler2Rot((rotate * DEG_TO_RAD)));
        
        // Set the stand target for the linked prim
        osSetLinkStandTarget(link, stand_link_target);
    }
 
    changed(integer change)
    {
        // Check if a link has been changed
        if (change & CHANGED_LINK)
        {
            // Get the key of the avatar sitting on the prim
            key user = llAvatarOnSitTarget();
 
            // If an avatar is sitting on the prim
            if (user != NULL_KEY)
            {
                avatar = user;
                debug(osKey2Name(avatar)); // Debug and display stand target
            }
            // If no avatar is sitting on the prim
            else if (user == NULL_KEY)
            {
                debug(osKey2Name(avatar)); // Debug and display stand target
                avatar = NULL_KEY;
            }
            // Reset the script if an unexpected condition occurs
            else
            {
                llResetScript();
            }
        }
    }
}
