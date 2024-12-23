/*
osNpcSayTo(key npc, key target, integer channel, string message)
The script you provided demonstrates the usage of osNpcSayTo() function to make an NPC say messages directly to a specific user. 
When touched, it saves the appearance of the toucher, creates an NPC near the toucher, and makes the NPC say "Hello world!", 
"I Love OpenSimulator!", and "The Open Source Metaverse!" directly to the user who touched the object every 5 seconds. 
When touched again, the NPC says "Goodbye!" to the user and gets removed.
*/

// osNpcSayTo Script Exemple
// Author: djphil
 
key npc; // Variable to store the NPC's key
key user; // Variable to store the user's key

default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcSayTo function.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcSayTo usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar touching the object
        user = llDetectedKey(0);

        // Calculate the position for the NPC to spawn near the toucher
        vector npcPos = llGetPos() + <-1.0, 0.0, 1.0>;

        // Save the appearance of the toucher
        osAgentSaveAppearance(user, "appearance");

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
        // When entering the 'hasNPC' state, start a timer event to make the NPC say messages directly to the user every 5 seconds
        llSetTimerEvent(5.0);
    }

    timer()
    {
        // Timer event triggered every 5 seconds

        // Stop the timer event to avoid overlapping say commands
        llSetTimerEvent(0.0);

        // Make the NPC say multiple messages directly to the user
        osNpcSayTo(npc, user, PUBLIC_CHANNEL, "Hello world!");
        osNpcSayTo(npc, user, PUBLIC_CHANNEL, "I Love OpenSimulator!");
        osNpcSayTo(npc, user, PUBLIC_CHANNEL, "The Open Source Metaverse!");

        // Restart the timer event to repeat the action
        llSetTimerEvent(5.0);
    }

    touch_start(integer number)
    {
        // When touched again, the NPC says "Goodbye!" directly to the user
        osNpcSayTo(npc, user, PUBLIC_CHANNEL, "Goodbye!");

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
