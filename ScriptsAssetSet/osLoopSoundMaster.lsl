/*
This script sets up two sounds to be played in OpenSim. When an object containing this script is touched, 
it toggles between playing and stopping the sounds defined as sound_master and sound_slave. 
The sounds are preloaded to reduce lag when they start playing. The volume of the sounds is set to 1.0, which represents full volume.
*/

// osLoopSoundMaster Script Example
// Author: djphil

// Define the UUIDs of the sounds to be used
string sound_master = "f4a0660f-5446-dea2-80b7-6482a082803c";
string sound_slave = "d7a9a565-a013-2a69-797d-5332baa1a947";

// Define the volume of the sounds
float volume = 1.0;

// Define a switch to toggle sound playback
integer switch;

// Define default state
default
{
    // State entry event
    state_entry()
    {
        // Preload the sounds to reduce lag when they are played
        llPreloadSound(sound_master);
        llPreloadSound(sound_slave);
        
        // Send a message to the public channel indicating how to use the script
        llSay(PUBLIC_CHANNEL, "Touch to see osLoopSoundMaster usage.");
    }
    
    // Touch event
    touch_start(integer number)
    {
        // Toggle the switch
        if (switch = !switch)
        {
            // If the switch is true, start looping the master sound and the slave sound
            osLoopSoundMaster(1, sound_master, volume); // Loop the master sound
            osLoopSoundSlave(2, sound_slave, volume); // Loop the slave sound
        }
        else
        {
            // If the switch is false, stop the sounds
            osStopSound(1); // Stop the master sound
            osStopSound(2); // Stop the slave sound
        }
    }
}
