/*
osNpcMoveToTarget(key npc, vector target, integer options)
This script is a part of a larger scenario where you would have additional states and events to control the behavior of the NPC. 
In this specific script, it sets up the initial state for the NPC and waits for a touch event to create the NPC and initiate its behavior. 
The osNpcMoveToTarget function with OS_NPC_NO_FLY option can then be used in subsequent states or events to move the NPC to a specific target position without allowing it to fly.
*/

// osNpcMoveToTarget Script Exemple
// Author: djphil
 
key npc; // Variable to store the NPC's key
default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcMoveToTarget with OS_NPC_NO_FLY option.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcMoveToTarget usage.");
        llSay(PUBLIC_CHANNEL, "This with the use of the option OS_NPC_NO_FLY.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar touching the object
        key toucher = llDetectedKey(0);

        // Calculate the position for the NPC to spawn near the object
        vector npcPos = llGetPos() + <-5.0, -1.0, 1.0>;

        // Save the appearance of the toucher
        osAgentSaveAppearance(toucher, "appearance");

        // Create the NPC with the specified name and appearance at the calculated position
        npc = osNpcCreate("ImYour", "Clone", npcPos, "appearance");

        // Change the state to 'hasNPC' to manage NPC behavior
        state hasNPC;
    }
}

 
