/*
osAdjustSoundVolume(integer linknum, float volume)
The script demonstrates adjusting the volume of an attached sound using the osAdjustSoundVolume function.
In the state_entry event handler, the script retrieves the name of the sound from the prim's inventory and checks if it's missing. If the sound is present, 
it informs users to touch the object to hear the adjusted sound.
In the touch_start event handler, a random volume between 0 and 1 is generated using llFrand. Then, 
the osAdjustSoundVolume function is called to adjust the volume of the sound for link 1, 
followed by playing the sound at the adjusted volume using osPlaySound. Finally, a message is sent to the public channel indicating the adjusted volume.
The commented-out section at the end of the script demonstrates how the script could be modified to use a UUID instead of retrieving the sound's name from the inventory.
*/

//
// osAdjustSoundVolume Script Example
// Author: djphil
//

// Define a variable to store the name or UUID of the sound
string sound;

default
{
    state_entry()
    {
        // Retrieve the name of the sound from the prim's inventory
        sound = llGetInventoryName(INVENTORY_SOUND, 0);

        // Check if the sound is missing in the inventory
        if (sound == "")
        {
            llSay(PUBLIC_CHANNEL, "Inventory sound missing ...");
        }

        else
        {
            llSay(PUBLIC_CHANNEL, "Touch to hear osAdjustSoundVolume running.");
        }
    }

    touch_start(integer number)
    {
        // Generate a random volume between 0 and 1
        float volume = llFrand(1.0);

        // Adjust the volume of the sound for the specified link number
        osAdjustSoundVolume(1, volume);

        // Play the sound at the adjusted volume for the specified link number
        osPlaySound(1, sound, volume);

        // Display a message indicating the adjusted volume
        llSay(PUBLIC_CHANNEL, "The volume of the primitive (link 1) has been adjusted to " + (string)volume);
    }
}
