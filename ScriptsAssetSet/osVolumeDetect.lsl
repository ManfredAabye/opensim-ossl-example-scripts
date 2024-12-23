/*
osVolumeDetect(integer detect)
    state_entry(): This is called when the script starts running. It sends a message to local chat and enables volume detection for the object.

    on_rez(integer hh): This is called when the object is rezzed (created or spawned). It also enables volume detection for the object.

    collision_start(integer uu): This is called when a collision starts with the object. It sends a message to the owner indicating the collision has started.

    collision_end(integer uu): This is called when a collision ends with the object. It sends a message to the owner indicating the collision has ended.

These functions are defined within the default state of the script.
*/

// Example of osVolumeDetect
 
default
{
    // This function is called when the script starts running
    state_entry()
    {
        // Send a message to the local chat indicating that the script is running
        llSay(0, "Script running");

        // Enable volume detection for the object
        osVolumeDetect(TRUE);
    }

    // This function is called when the object is rezzed (created or spawned)
    on_rez(integer hh)
    {
        // Enable volume detection for the object
        osVolumeDetect(TRUE);
    }

    // This function is called when a collision starts with the object
    collision_start(integer uu)
    {
        // Send a message to the owner of the object indicating that a collision started
        llOwnerSay("s");
    }

    // This function is called when a collision ends with the object
    collision_end(integer uu)
    {
        // Send a message to the owner of the object indicating that a collision ended
        llOwnerSay("e");
    }    
}
