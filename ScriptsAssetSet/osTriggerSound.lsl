/*
osTriggerSound(integer linknum, string sound, float volume)
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code.
*/

//
// osTriggerSound Script Example
//
 
// Define a variable to hold the name of the sound inventory item
string sound;

// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Get the name of the first sound inventory item
        sound = llGetInventoryName(INVENTORY_SOUND, 0);
 
        // Check if the sound inventory item is missing
        if (sound == "")
        {
            // Send a message to the public chat channel indicating that the inventory sound is missing
            llSay(PUBLIC_CHANNEL, "Inventory sound missing ...");
        }
        else
        {
            // Send a message to the public chat channel indicating that the object is ready to trigger the sound
            llSay(PUBLIC_CHANNEL, "Touch to hear osTriggerSound running.");
        }
    }
 
    // This event is triggered when an avatar touches the object
    touch_start(integer number)
    {
        // Trigger the sound with a volume of 1.0
        osTriggerSound(1, sound, 1.0);
    }
}
