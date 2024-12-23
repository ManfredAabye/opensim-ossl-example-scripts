/*
osPreloadSound(integer linknum, string sound)
    string sound;: Declares a string variable named sound to store the name of the sound from the object's inventory.

    state_entry(): This is an event handler that is called automatically when the script is initialized or reset. In this case, it retrieves the name of the first sound in the object's inventory using llGetInventoryName function. If the sound is missing (i.e., sound is an empty string), it sends a message to the public channel indicating that the inventory sound is missing. Otherwise, it sends messages indicating that the sound is being preloaded and then ready to play.

    touch_start(integer number): This event is triggered when the object is touched by an avatar. In this script, it plays the preloaded sound stored in the sound variable using the osPlaySound function with the specified handle (1) and volume (1.0).

Overall, this script allows users to preload and play a sound by touching an object with this script inside Second Life. However, please note that this script utilizes OpenSim-specific functions (osPreloadSound and osPlaySound) and may not work in other virtual world platforms or grids. Additionally, it's important to ensure that the object contains a sound in its inventory for this script to work properly.
*/

// osPreloadSound Script Example
// Author: djphil

 
string sound; // Declares a string variable to store the name of the sound.

default
{
    state_entry()
    {
        sound = llGetInventoryName(INVENTORY_SOUND, 0); // Retrieves the name of the first sound in the object's inventory.

        if (sound == "")
        {
            llSay(PUBLIC_CHANNEL, "Inventory sound missing ..."); // Sends a message to the public channel if the inventory sound is missing.
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "Preloading sound ..."); // Sends a message to the public channel indicating that the sound is being preloaded.
            osPreloadSound(1, sound); // Preloads the sound with the specified handle (1).
            llSay(PUBLIC_CHANNEL, "Sound ready to play!"); // Sends a message to the public channel indicating that the sound is ready to play.
        }
    }

    touch_start(integer number)
    {
        osPlaySound(1, sound, 1.0); // Plays the preloaded sound with a volume of 1.0 when touched.
    }
}
