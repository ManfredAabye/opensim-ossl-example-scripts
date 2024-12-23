/*
float osGetHealth(key avatar)
This function retrieves the health percentage of the specified avatar.
*/

//
// osGetHealth Script Example
//

default
{
    // The touch event is triggered when an object is touched.
    touch(integer t)
    {
        // Retrieve the key of the avatar that touched the object.
        key agentID = llDetectedKey(0);

        // Cause damage to the avatar that touched the object.
        osCauseDamage(agentID, 50);

        // Retrieve the health percentage of the avatar using osGetHealth().
        float health = osGetHealth(agentID);

        // Display the health percentage of the avatar.
        llSay(0, llKey2Name(agentID) + " has " + (string)health + "% health left.");
    }
}
