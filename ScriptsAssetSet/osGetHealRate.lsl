/*
float osGetHealRate(key avatar)
This function retrieves the heal rate of the specified avatar.
*/

//
// osGetHealth Script Example
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Get the owner's key.
        key uuid = llGetOwner();

        // Set the heal rate for the owner's avatar.
        osSetHealRate(uuid, 10.0);

        // Cause damage to the owner's avatar.
        osCauseDamage(uuid, 50.0);

        // Retrieve the heal rate of the owner's avatar using osGetHealRate().
        float heal_rate = osGetHealRate(uuid);

        // Retrieve the health percentage of the owner's avatar using osGetHealth().
        float health = osGetHealth(uuid);

        // Display the heal rate and health percentage of the owner's avatar.
        llOwnerSay("osGetHealRate = " + (string)heal_rate);
        llOwnerSay(llKey2Name(uuid) + " has " + (string)health + "% health left.");
    }
}
