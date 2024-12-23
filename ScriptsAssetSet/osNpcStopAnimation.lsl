/*
osNpcStopAnimation(key npc, string animation)
touch_start(integer number): This event is triggered when an object is touched by an avatar. 
It retrieves the key of the touching avatar, calculates the position for the NPC, saves the appearance of the touching avatar, 
creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. It sets a timer event for 5 seconds. 
When the timer event triggers, it checks the value of the 'ani' variable. 
If it's TRUE, it makes the NPC say "Goodbye!", makes the NPC stand up, removes the NPC, resets the 'npc' variable, resets the 'ani' variable, 
and transitions back to the 'default' state. 
If the 'ani' variable is not TRUE, it sets the 'ani' variable to TRUE, makes the NPC play the specified animation using osNpcPlayAnimation, 
and makes the NPC say "Hello world!". If the NPC is touched, it stops the specified animation for the NPC using osNpcStopAnimation and sets a timer event for 3 seconds.

This script demonstrates the creation, manipulation, and removal of an NPC, 
as well as the usage of osNpcPlayAnimation and osNpcStopAnimation to make the NPC play and stop an animation respectively. 
Additionally, it introduces a variable 'ani' to toggle between playing and stopping an animation for the NPC.
*/

// osNpcStopAnimation Script Exemple
// Author: djphil
 
string animation = "sit_ground"; // Declares a string variable named 'animation' and initializes it with the animation name.
integer ani; // Declares an integer variable named 'ani'.
key npc; // Declares a key variable named 'npc'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcStopAnimation usage."); // Sends a message to the public channel.
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

        if (ani == TRUE) // If the 'ani' variable is TRUE.
        {
            osNpcSay(npc, "Goodbye!"); // Makes the NPC say "Goodbye!".
            osNpcStand(npc); // Makes the NPC stand up.
            osNpcRemove(npc); // Removes the NPC.
            npc = NULL_KEY; // Resets the 'npc' variable.
            ani = FALSE; // Resets the 'ani' variable.
            state default; // Transitions back to the 'default' state.
        }
        else // If the 'ani' variable is not TRUE.
        {
            ani = TRUE; // Sets the 'ani' variable to TRUE.
            osNpcPlayAnimation(npc, animation); // Makes the NPC play the specified animation.
            osNpcSay(npc, "Hello world!"); // Makes the NPC say "Hello world!".
        }
    }

    touch_start(integer number)
    {
        osNpcStopAnimation(npc, animation); // Stops the specified animation for the NPC.
        llSetTimerEvent(3.0); // Sets a timer event for 3 seconds.
    }
}
