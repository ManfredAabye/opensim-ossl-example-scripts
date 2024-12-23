/*
osNpcWhisper(key npc, int channel, string message)
touch_start(integer number): This event is triggered when an object is touched by an avatar. 
It retrieves the key of the touching avatar, calculates the position for the NPC, saves the appearance of the touching avatar, 
creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. It sets a timer event for 5 seconds. When the timer event triggers, it makes the NPC whisper "Hello world!", "I Love OpenSimulator!", 
and "The Open Source Metaverse!" in the public channel using osNpcWhisper. 
If the NPC is touched, it makes the NPC whisper "Goodbye!" in the public channel, removes the NPC, resets the 'npc' variable, and transitions back to the 'default' state.

This script demonstrates the creation, manipulation, and removal of an NPC, as well as the usage of osNpcWhisper to make the NPC whisper messages in the public channel.
*/

// osNpcWhisper Script Exemple
// Author: djphil
 
key npc; // Declares a key variable named 'npc'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcWhisper usage."); // Sends a message to the public channel.
    }

    touch_start(integer number)
    {
        key toucher = llDetectedKey(0); // Retrieves the key of the touching avatar.
        vector npcPos = llGetPos() + <-1.0, 0.0, 1.0>; // Calculates the position for the NPC.
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
        osNpcWhisper(npc, PUBLIC_CHANNEL, "Hello world!"); // Makes the NPC whisper "Hello world!" in the public channel.
        osNpcWhisper(npc, PUBLIC_CHANNEL, "I Love OpenSimulator!"); // Makes the NPC whisper "I Love OpenSimulator!" in the public channel.
        osNpcWhisper(npc, PUBLIC_CHANNEL, "The Open Source Metaverse!"); // Makes the NPC whisper "The Open Source Metaverse!" in the public channel.
    }

    touch_start(integer number)
    {
        osNpcWhisper(npc, PUBLIC_CHANNEL, "Goodbye!"); // Makes the NPC whisper "Goodbye!" in the public channel.
        llSetTimerEvent(0.0); // Resets the timer event.
        osNpcRemove(npc); // Removes the NPC.
        npc = NULL_KEY; // Resets the 'npc' variable.
        state default; // Transitions back to the 'default' state.
    }
}
