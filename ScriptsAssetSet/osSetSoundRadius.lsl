/*
void osSetSoundRadius(integer linknum, float radius);
This script sets up a touch-triggered sound effect within the virtual environment. 
When the object associated with this script is touched, it triggers the specified sound within a radius of 5 meters. 
Before setting the sound radius, it checks whether the provided UUID is valid. If the UUID is invalid, it notifies users about the issue.
*/

//
// osSetSoundRadius Script Example
//
 
string sound = "f4a0660f-5446-dea2-80b7-6482a082803c"; // Specifies the UUID of the sound
float radius = 5.0; // Defines the radius in which the sound will be audible

default
{
    state_entry()
    {
        if (osIsUUID(sound)) // Checks if the provided UUID is valid
        {
            llSay(PUBLIC_CHANNEL, "Touch to hear osSetSoundRadius running in a radius of " + (string)radius + " meters."); // Notifies users about the sound radius
            osSetSoundRadius(1, radius); // Sets the sound radius for the specified sound
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "Invalid uuid detected ..."); // Notifies users if the provided UUID is invalid
        }
    }

    touch_start(integer number)
    {
        osTriggerSound(1, sound, 1.0); // Triggers the specified sound when touched
    }
}
