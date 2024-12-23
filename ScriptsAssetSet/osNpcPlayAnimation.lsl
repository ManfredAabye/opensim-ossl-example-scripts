/*
osNpcPlayAnimation(key npc, string animation)
This script demonstrates the usage of osNpcPlayAnimation() function in OpenSimulator. When touched, it creates an NPC, 
saves the appearance of the toucher, and makes the NPC say "Hello world!" every 5 seconds. 
Additionally, it plays the "clap" animation on the NPC when it speaks. When touched again, the NPC says "Goodbye!", stands still, and then gets removed.
*/

// osNpcPlayAnimation Script Exemple
// Author: djphil
 
key npc; // Variable to store the NPC's key

default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcPlayAnimation.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcPlayAnimation usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar touching the object
        key toucher = llDetectedKey(0);

        // Calculate the position for the NPC to spawn near the object
        vector npcPos = llGetPos() + <1.0, 0.0, 1.0>;

        // Save the appearance of the toucher
        osAgentSaveAppearance(toucher, "appearance");

        // Create the NPC with the specified name and appearance at the calculated position
        npc = osNpcCreate("ImYour", "Clone", npcPos, "appearance");

        // Change the state to 'hasNPC' to manage NPC behavior
        state hasNPC;
    }
}

state hasNPC
{
    state_entry()
    {
        // When entering the 'hasNPC' state, start a timer event to make the NPC say "Hello world!" every 5 seconds
        llSetTimerEvent(5.0);
    }

    timer()
    {
        // Timer event triggered every 5 seconds

        // Stop the timer event to avoid overlapping say commands
        llSetTimerEvent(0.0);

        // Make the NPC say "Hello world!"
        osNpcSay(npc, "Hello world!");

        // Play the "clap" animation on the NPC
        osNpcPlayAnimation(npc, "clap");

        // Restart the timer event to repeat the action
        llSetTimerEvent(5.0);
    }

    touch_start(integer number)
    {
        // When touched again, the NPC says "Goodbye!"
        osNpcSay(npc, "Goodbye!");

        // Stop the timer event
        llSetTimerEvent(0.0);

        // Make the NPC stand still
        osNpcStand(npc);

        // Remove the NPC
        osNpcRemove(npc);

        // Reset the npc variable
        npc = NULL_KEY;

        // Change the state back to 'default'
        state default;
    }
}
