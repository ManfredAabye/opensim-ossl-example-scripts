/*
integer osTeleportObject(key objectID, vector targetPos, rotation rot, integer flags)
Arguments:
    objectID the id of the linkset to teleport
    targetPos target position in region local coords 

    rot a rotation.
    flags 

Flags:
    OSTPOBJ_NONE it is just 0
    OSTPOBJ_STOPATTARGET object is stopped at destination
    OSTPOBJ_STOPONFAIL stops at start point if tp fails (still does nothing)
    OSTPOBJ_SETROT the rotation is the final object rotation, otherwise is a added rotation 
*/

// Example of osTeleportObject
 
// This script teleports the object to a specified target position in the region when touched.

// Define the default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the object's owner or the public chat indicating that the script is running
        llSay(0, "Script running");
    }

    // This event is triggered when an avatar touches the object
    touch_start(integer num)
    {
        // Define the target position in region local coordinates
        vector target = <873.911926, 879.844910, 21.332354>;  

        // Define the rotation to apply during teleportation (if needed)
        rotation rot = <0, 0, 0.707, 0.707>;

        // Teleport the object (this script's owner) to the specified target position and rotation
        // The last parameter '1' indicates that the object should preserve its local position
        osTeleportObject(llGetKey(), target, rot, 1);
    }
}
