/*
osNpcTouch(key npcKey, key objectKey, integer linkNum)
touch_start(integer number): This event is triggered when an object is touched by an avatar. 
It retrieves the key of the touching avatar, calculates the position for the NPC, saves the appearance of the touching avatar, 
creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. It sets a timer event for 5 seconds. 
When the timer event triggers, it checks if the 'hello' variable is FALSE. If it's FALSE, it makes the NPC say "Hello world!" and sets the 'hello' variable to TRUE. 
Then, it sets a timer event for 2 seconds and simulates the NPC being touched by an avatar using osNpcTouch. If an object is touched, it checks if it's an NPC using osIsNpc. 
If it's an NPC, it randomly changes the color of the object. If it's not an NPC, it resets the color of the object to white, makes the NPC say "Goodbye!", 
removes the NPC, resets the 'npc' and 'hello' variables, and transitions back to the 'default' state.

This script demonstrates the creation, manipulation, and removal of an NPC, as well as the usage of osNpcTouch to simulate an NPC being touched by an avatar. 
Additionally, it introduces a variable 'hello' to track whether the NPC has greeted the avatar with "Hello world!" or not.
*/

// osNpcTouch Script Exemple
// Author: djphil
 
key npc; // Declares a key variable named 'npc'.
integer hello; // Declares an integer variable named 'hello'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcTouch usage."); // Sends a message to the public channel.
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
        if (hello == FALSE) // If the 'hello' variable is FALSE.
        {
            osNpcSay(npc, "Hello world!"); // Makes the NPC say "Hello world!".
            hello = TRUE; // Sets the 'hello' variable to TRUE.
        }

        llSetTimerEvent(2.0); // Sets a timer event for 2 seconds.
        osNpcTouch(npc, llGetKey(), LINK_THIS); // Simulates the NPC being touched by an avatar.
    }

    touch_start(integer number)
    {
        if (osIsNpc(llDetectedKey(0))) // If the detected object is an NPC.
        {
            llSetColor(<llFrand(1.0), llFrand(1.0), llFrand(1.0)>, ALL_SIDES); // Randomly changes the color of the object.
        }
        else // If the detected object is not an NPC.
        {
            llSetColor(<1.0, 1.0, 1.0>, ALL_SIDES); // Resets the color of the object to white.
            osNpcSay(npc, "Goodbye!"); // Makes the NPC say "Goodbye!".
            llSetTimerEvent(0.0); // Resets the timer event.
            osNpcRemove(npc); // Removes the NPC.
            npc = NULL_KEY; // Resets the 'npc' variable.
            hello = FALSE; // Resets the 'hello' variable.
            state default; // Transitions back to the 'default' state.
        }
    }
}
