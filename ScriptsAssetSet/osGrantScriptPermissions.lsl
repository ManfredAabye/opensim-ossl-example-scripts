/*
osGrantScriptPermissions(key allowed_key, string function)
This script allows users to enable and disable permissions for a list of OSSL (OpenSim Scripting Language) functions by touching an object. 
When touched, the script grants permissions for the specified functions and switches to the "enabled" state, changing the object's color to green. 
When touched again, the script revokes permissions for the functions and switches back to the "default" state, changing the object's color back to red.
*/

// osGrantScriptPermissions Script Example
 
// List of OSSL functions to enable/disable permissions for
list functions = ["osNpcCreate", "osNpcGetPos", "osNpcLoadAppearance", "osNpcGetRot", "osNpcMoveTo",
                "osNpcRemove", "osNpcSaveAppearance", "osNpcSay", "osNpcSetRot","osNpcSit", "osNpcStand",
                "osNpcPlayAnimation", "osNpcStopAnimation","osNpcMoveToTarget", "osNpcStopMoveToTarget",
                "osOwnerSaveAppearance", "osAgentSaveAppearance"];

// Default state handler
default
{
    state_entry()
    {
        // Set color to red when script starts
        llSetColor(<1,0,0>,ALL_SIDES);
    }
 
    touch_start(integer det)
    {
        // Display message when touched
        llSay(0, "Enable");
 
        // Grant script permissions to llGetOwner() for specified functions
        osGrantScriptPermissions(llGetOwner(), functions);  
        
        // Switch to the enabled state
        state enabled;
    }
}

// Enabled state handler
state enabled
{
    state_entry()
    {
        // Set color to green when entering the enabled state
        llSetColor(<0,1,0>,ALL_SIDES);
        
        // Display message indicating OSSL functions are enabled
        llSay(0, "ossl functions enabled");
    }
 
    touch_start(integer det)
    {
        // Revoke script permissions for specified functions
        osRevokeScriptPermissions(llGetOwner(), functions);
        
        // Switch back to the default state
        state default;
    }
}
