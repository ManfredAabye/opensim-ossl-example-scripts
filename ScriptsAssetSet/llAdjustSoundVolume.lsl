/*
This script listens for messages on channel 42 from the owner and adjusts the sound volume based on the received message. 
The script assumes that the message sent by the owner is a floating-point number representing the desired volume level. 
It then adjusts the sound volume accordingly using llAdjustSoundVolume function and notifies the owner about the volume change via llOwnerSay function.
*/

// Define the default state
default
{
    // Event handler for state entry
    state_entry()
    {
        // Listen on channel 42 for messages from the owner
        llListen(42, "", llGetOwner(), "");
    }

    // Event handler for listening on channel 42
    listen(integer chan, string name, key id, string msg)
    {
        // Convert the received message to a float value
        float value = (float)msg;

        // Adjust the sound volume based on the received value
        llAdjustSoundVolume(value);

        // Notify the owner about the volume change
        llOwnerSay("Volume set to: " + (string)value + " of 1.0");
    }
}
