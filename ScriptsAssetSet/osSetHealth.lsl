/*
osSetHealth(key avatar, float health)
    The touch event is triggered when an avatar touches the object.
    Inside the touch event, llDetectedKey(0) is used to get the UUID of the avatar who touched the object and assign it to the variable agentID.
    osSetHealth(agentID, 50) is then used to set the health of the avatar identified by agentID to 50%.
    osGetHealth(agentID) retrieves the current health percentage of the avatar identified by agentID, and (string) is used to convert it to a string.
    Finally, llSay(0, ...) announces the remaining health percentage of the avatar in local chat, along with their name retrieved using llKey2Name(agentID).
*/

//
// osSetHealth Script Example
//
 
default
{
    // This event is triggered when the object is touched by an avatar
    touch(integer t)
    {
        // Get the UUID of the avatar who touched the object
        key agentID = llDetectedKey(0);
        
        // Set the health of the avatar to 50%
        osSetHealth(agentID, 50);
        
        // Retrieve the health percentage of the avatar and announce it in local chat
        llSay(0, llKey2Name(agentID) + " has " + (string)osGetHealth(agentID) + "% health left.");
    }
}
