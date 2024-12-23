/*
osNpcStand(key npc)
touch_start(integer number): This event is triggered when an object is touched by an avatar. 
It retrieves the key of the touching avatar, calculates the position for the NPC, saves the appearance of the touching avatar, 
creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. 
It sets a timer event for 5 seconds. When the timer event triggers, it checks the value of the 'sit' variable. 
If it's TRUE, it makes the NPC say "Goodbye!", makes the NPC stand up, removes the NPC, resets the 'npc' variable, resets the 'sit' variable, and transitions back to the 'default' state. 
If the 'sit' variable is not TRUE, it sets the 'sit' variable to TRUE, makes the NPC sit down immediately using osNpcSit, and makes the NPC say "Hello world!". 
If the NPC is touched, it makes the NPC stand up and sets a timer event for 3 seconds.

This script demonstrates the creation, manipulation, and removal of an NPC, as well as the usage of osNpcSit and osNpcStand to make the NPC sit and stand up respectively. 
Additionally, it introduces a variable 'sit' to toggle between sitting and standing states of the NPC.
*/

// osNpcStand Script Exemple
// Author: djphil
 
key npc; // Declares a key variable named 'npc'.
integer sit; // Declares an integer variable named 'sit'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcStand usage."); // Sends a message to the public channel.
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

        if (sit == TRUE) // If the 'sit' variable is TRUE.
        {
            osNpcSay(npc, "Goodbye!"); // Makes the NPC say "Goodbye!".
            osNpcStand(npc); // Makes the NPC stand up.
            osNpcRemove(npc); // Removes the NPC.
            npc = NULL_KEY; // Resets the 'npc' variable.
            sit = FALSE; // Resets the 'sit' variable.
            state default; // Transitions back to the 'default' state.
        }
        else // If the 'sit' variable is not TRUE.
        {
            sit = TRUE; // Sets the 'sit' variable to TRUE.
            osNpcSit(npc, llGetKey(), OS_NPC_SIT_NOW); // Makes the NPC sit down immediately.
            osNpcSay(npc, "Hello world!"); // Makes the NPC say "Hello world!".
        }
    }

    touch_start(integer number)
    {
        osNpcStand(npc); // Makes the NPC stand up.
        llSetTimerEvent(3.0); // Sets a timer event for 3 seconds.
    }
}
