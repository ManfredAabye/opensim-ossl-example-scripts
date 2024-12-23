/*
osStopSound(integer linknum)
    string soundName_1; string soundName_2; integer power;: Declaration of variables to store the names of two sounds from the object's inventory (soundName_1 and soundName_2) and a variable to manage the power state (power).
    state_entry(): Event handler triggered when the script starts running. It retrieves the names of the first and second sounds from the object's inventory. If one or both sounds are missing, it notifies the owner. Otherwise, it notifies the public to touch the object.
    touch_start(integer number): Event handler triggered when the object associated with the script is touched.
    Inside touch_start, the script toggles the power state (power) using the ! operator. If power is true (1), it means the sounds are currently playing, so it stops both sounds using osStopSound(LINK_SET). If power is false (0), it means the sounds are not playing, so it starts looping both sounds using osLoopSound with a volume of 1.0.
    osLoopSound and osStopSound are OpenSim-specific functions for managing sound playback. osLoopSound starts looping a sound with a specified volume, and osStopSound stops all sounds associated with the object.

In summary, this script allows users to toggle the playback of two looping sounds by touching the object. When touched, it either starts or stops the sounds depending on their current playback state.
*/

// osStopSound Script Example
// Author: djphil
// Usage: Link 2 prims far from each other and place this script and sounds on root

 
string soundName_1;
string soundName_2;
integer power;
 
default
{
    state_entry()
    {
        // Get the first and the second inventory sound names
        soundName_1 = llGetInventoryName(INVENTORY_SOUND, 0);
        soundName_2 = llGetInventoryName(INVENTORY_SOUND, 1);
 
        if (soundName_1 == "" || soundName_2 == "")
        {
            llOwnerSay("Inventory sound(s) missing ..."); // Notify owner if one or both sounds are missing from inventory
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "Touch to see osStopSound usage."); // Notify public to touch the object
        }
    }
 
    touch_start(integer number)
    {
        if (power = !power) // Toggle the power state
        {
            osLoopSound(1, soundName_1, 1.0); // Start looping the first sound
            osLoopSound(2, soundName_2, 1.0); // Start looping the second sound
        }
        else
        {
            osStopSound(LINK_SET); // Stop all sounds associated with the object
        }
    }
}
