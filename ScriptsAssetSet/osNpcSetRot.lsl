/*
osNpcSetRot(key npc, rotation rot)
touch_start(integer number): This event is triggered when an object is touched by an avatar. It retrieves the key of the touching avatar, 
alculates the position for the NPC, saves the appearance of the touching avatar, creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. It sets a timer event for 5 seconds. 
When the timer event triggers, it makes the NPC say "Hello world!" and sets its rotation. If the NPC is touched, 
it makes the NPC say "Goodbye!", removes the NPC, resets the 'npc' variable, and transitions back to the 'default' state.

This script demonstrates the creation, manipulation, and removal of an NPC, as well as the usage of osNpcSetRot to set the rotation of the NPC.
*/

// osNpcSetRot Script Exemple
// Author: djphil
 
key npc; // Declares a key variable named 'npc'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcSetRot usage."); // Sends a message to the public channel.
    }

    touch_start(integer number)
    {
        key toucher = llDetectedKey(0); // Retrieves the key of the touching avatar.
        vector npcPos = llGetPos() + <1.0, 0.0, 1.0>; // Calculates the position for the NPC.
        osAgentSaveAppearance(toucher, "appearance"); // Saves the appearance of the touching avatar.
        npc = osNpcCreate("ImYour", "Clone", npcPos, "appearance"); // Creates an NPC with the given appearance.
        state hasNPC; // Transitions to the 'hasNPC' state.
    }
}

state hasNPC
{
    state_entry()
    {
        llSetTimerEvent(5.0); // Sets a timer event for 5 seconds.
    }

    timer()
    {
        llSetTimerEvent(0.0); // Resets the timer event.
        osNpcSay(npc, "Hello world!"); // Makes the NPC say "Hello world!".
        osNpcSetRot(npc, <0.000000, 0.000000, 1.000000, 0.000000>); // Sets the rotation of the NPC.
    }

    touch_start(integer number)
    {
        osNpcSay(npc, "Goodbye!"); // Makes the NPC say "Goodbye!".
        llSetTimerEvent(0.0); // Resets the timer event.
        osNpcRemove(npc); // Removes the NPC.
        npc = NULL_KEY; // Resets the 'npc' variable.
        state default; // Transitions back to the 'default' state.
    }
}
