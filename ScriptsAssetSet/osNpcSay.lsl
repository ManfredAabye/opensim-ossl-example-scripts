/*
osNpcSay(key npc, integer channel, string message)
The provided script demonstrates the usage of osNpcSay() function without specifying a channel. 
When touched, it creates an NPC, saves the appearance of the toucher, and makes the NPC say "Hello world!", "I Love OpenSimulator!", 
and "The Open Source Metaverse!" every 5 seconds. 
When touched again, the NPC says "Goodbye!" and gets removed.
*/

//
// osNpcSay (without channel) Script Exemple
// Author: djphil
//
 
key npc; // Variable to store the NPC's key

default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcSay without specifying a channel.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcSay (without channel) usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar touching the object
        key toucher = llDetectedKey(0);

        // Calculate the position for the NPC to spawn near the object
        vector npcPos = llGetPos() + <-1.0, 0.0, 1.0>;

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
        // When entering the 'hasNPC' state, start a timer event to make the NPC say messages every 5 seconds
        llSetTimerEvent(5.0);
    }

    timer()
    {
        // Timer event triggered every 5 seconds

        // Stop the timer event to avoid overlapping say commands
        llSetTimerEvent(0.0);

        // Make the NPC say multiple messages without specifying a channel
        osNpcSay(npc, "Hello world!");
        osNpcSay(npc, "I Love OpenSimulator!");
        osNpcSay(npc, "The Open Source Metaverse!");

        // Restart the timer event to repeat the action
        llSetTimerEvent(5.0);
    }

    touch_start(integer number)
    {
        // When touched again, the NPC says "Goodbye!"
        osNpcSay(npc, "Goodbye!");

        // Stop the timer event
        llSetTimerEvent(0.0);

        // Remove the NPC
        osNpcRemove(npc);

        // Reset the npc variable
        npc = NULL_KEY;

        // Change the state back to 'default'
        state default;
    }
}


/* And with channel:
The provided script demonstrates the usage of osNpcSay() function with a specified channel. 
When touched, it creates an NPC, saves the appearance of the toucher, and makes the NPC say "Hello world!", 
"I Love OpenSimulator!", and "The Open Source Metaverse!" every 5 seconds. When touched again, the NPC says "Goodbye!" and gets removed.
*/
/*

//
// osNpcSay (with channel) Script Exemple
// Author: djphil
//
 
key npc; // Variable to store the NPC's key

default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcSay with a specified channel.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcSay (with channel) usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar touching the object
        key toucher = llDetectedKey(0);

        // Calculate the position for the NPC to spawn near the object
        vector npcPos = llGetPos() + <-1.0, 0.0, 1.0>;

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
        // When entering the 'hasNPC' state, start a timer event to make the NPC say messages every 5 seconds
        llSetTimerEvent(5.0);
    }

    timer()
    {
        // Timer event triggered every 5 seconds

        // Stop the timer event to avoid overlapping say commands
        llSetTimerEvent(0.0);

        // Make the NPC say multiple messages with a specified channel
        osNpcSay(npc, PUBLIC_CHANNEL, "Hello world!");
        osNpcSay(npc, PUBLIC_CHANNEL, "I Love OpenSimulator!");
        osNpcSay(npc, PUBLIC_CHANNEL, "The Open Source Metaverse!");

        // Restart the timer event to repeat the action
        llSetTimerEvent(5.0);
    }

    touch_start(integer number)
    {
        // When touched again, the NPC says "Goodbye!" with a specified channel
        osNpcSay(npc, PUBLIC_CHANNEL, "Goodbye!");

        // Stop the timer event
        llSetTimerEvent(0.0);

        // Remove the NPC
        osNpcRemove(npc);

        // Reset the npc variable
        npc = NULL_KEY;

        // Change the state back to 'default'
        state default;
    }
}

*/
