/*
osPlaySoundSlave(integer linknum, string sound, float volume)
    string sound_master and string sound_slave: Variables to store the UUIDs of the master and slave sounds, respectively.

    float volume = 1.0;: Variable to set the volume level for both sounds.

    integer switch;: Variable to control the state of playing or stopping sounds.

    state_entry(): An event handler that is triggered when the script is initialized or reset. It preloads both the master and slave sounds and informs users to touch for demonstration.

    touch_start(integer number): An event handler triggered when an object is touched. It toggles the switch variable to alternate between playing and stopping sounds. If switch is true, it plays the master sound in a loop using osLoopSoundMaster and plays the slave sound once using osPlaySoundSlave. If switch is false, it stops both sounds using osStopSound.

Overall, this script demonstrates the usage of osPlaySoundSlave and osLoopSoundMaster functions in OpenSim to control two sounds independently. When touched, it plays the master sound in a loop and the slave sound once, and touching again stops both sounds.
*/


// osPlaySoundSlave
// Author: djphil

 
// Can be sound's name in object's inventory or the sound uuid
string sound_master = "f4a0660f-5446-dea2-80b7-6482a082803c";
string sound_slave = "d7a9a565-a013-2a69-797d-5332baa1a947";

float volume = 1.0;
integer switch;

default
{
    state_entry()
    {
        llPreloadSound(sound_master); // Preload the master sound.
        llPreloadSound(sound_slave); // Preload the slave sound.
        llSay(PUBLIC_CHANNEL, "Touch to see osPlaySoundSlave usage."); // Notify users to touch for demonstration.
    }

    touch_start(integer number)
    {
        if (switch = !switch) // Toggle switch to alternate between playing and stopping sounds.
        {
            osLoopSoundMaster(1, sound_master, volume); // Play master sound in a loop.
            osPlaySoundSlave(2, sound_slave, volume); // Play slave sound once.
        }
        else
        {
            osStopSound(1); // Stop playing the master sound.
            osStopSound(2); // Stop playing the slave sound.
        }
    }
}
