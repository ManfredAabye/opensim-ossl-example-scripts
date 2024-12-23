/*
osRevokeScriptPermissions(key revoked_key, string function)
This script sets up two states: 'default' and 'enabled'. 
In the 'default' state, the script sets the color of all sides of the prim to red. 
When an avatar touches the object, it grants script permissions for the listed functions to the owner and transitions to the 'enabled' state. 
In the 'enabled' state, the script sets the color of all sides of the prim to green and says "ossl functions enabled" in local chat. 
When an avatar touches the object again, it revokes script permissions for the listed functions from the owner and transitions back to the 'default' state.
*/

// 
// osRevokeScriptPermissions exxample.
//

// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Set the color of all sides of the prim to red
        llSetColor(<1,0,0>, ALL_SIDES);
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer det)
    {
        // Say "Enable" in local chat
        llSay(0, "Enable");
 
        // Grant the owner of the object script permissions for the listed functions
        // osGrantScriptPermissions(agent, functions) grants the specified functions to the agent
        osGrantScriptPermissions(llGetOwner(), functions);
        
        // Change the state to 'enabled'
        state enabled;
    }
}
 
// This state is activated when the script is enabled
state enabled
{
    // This function is called when the state is entered
    state_entry()
    {
        // Set the color of all sides of the prim to green
        llSetColor(<0,1,0>, ALL_SIDES);
        
        // Say "ossl functions enabled" in local chat
        llSay(0, "ossl functions enabled");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer det)
    {
        // Revoke script permissions for the listed functions from the owner
        // osRevokeScriptPermissions(agent, functions) revokes the specified functions from the agent
        osRevokeScriptPermissions(llGetOwner(), functions);
        
        // Change the state back to 'default'
        state default;
    }
}
