/*
float osSetHealRate(key avatar, float healrate)
    In the state_entry() event, the script begins by getting the UUID of the object owner using llGetOwner().
    It then sets the healing rate for the owner to 10.0 health points per second using osSetHealRate().
    Next, it causes damage of 50.0 health points to the owner using osCauseDamage().
    After that, it retrieves the healing rate of the owner using osGetHealRate() and displays it using llOwnerSay().
    Finally, it retrieves the health percentage of the owner using osGetHealth() and displays it along with the owner's name using llOwnerSay().
*/

//
// osSetHealRate Script Example
//
 
default
{
    state_entry()
    {
        // Get the UUID of the object owner
        key uuid = llGetOwner();
        
        // Set the healing rate for the owner to 10.0 health points per second
        osSetHealRate(uuid, 10.0);
        
        // Cause damage of 50.0 health points to the owner
        osCauseDamage(uuid, 50.0);
        
        // Retrieve and display the healing rate of the owner
        llOwnerSay("osGetHealRate = " + (string)osGetHealRate(uuid));
        
        // Retrieve the health percentage of the owner and display it
        llOwnerSay(llKey2Name(uuid) + " has " + (string)osGetHealth(uuid) + "% health left.");
    }
}
