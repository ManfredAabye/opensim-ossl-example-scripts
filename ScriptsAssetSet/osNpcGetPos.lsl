/*
    In the default state:
        When touched, it saves the appearance of the toucher, calculates a position for the NPC near the object, creates the NPC with the specified name and appearance, and changes the state to hasNPC.
    In the hasNPC state:
        When entering this state, a timer event is started to make the NPC say "Hello world!" every 5 seconds.
        When the timer event triggers, the NPC says "Hello world!" and then retrieves its current position using osNpcGetPos() and says it.
        When touched, the NPC says "Goodbye!", the timer event is stopped, the NPC is removed, the npc variable is reset, and the state is changed back to default.
*/

// osNpcGetPos Script Exemple
// Author: djphil
 
key npc; // Variable to store the NPC's key

default
{
    state_entry()
    {
        // When the object enters the default state, it sends a message to the public channel
        // instructing users to touch it to see the usage of osNpcGetPos.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcGetPos usage.");
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

        // Make the NPC say its current position
        osNpcSay(npc, "My current position is: " + (string)osNpcGetPos(npc));

        // Restart the timer event to repeat the action
        llSetTimerEvent(5.0);
    }

    touch_start(integer number)
    {
        // When the NPC is touched, make it say "Goodbye!"
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
