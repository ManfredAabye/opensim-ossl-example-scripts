/*
osNpcStopMoveToTarget(key npc)
touch_start(integer number): This event is triggered when an object is touched by an avatar. 
It retrieves the key of the touching avatar, calculates the position for the NPC, saves the appearance of the touching avatar, 
creates an NPC with the given appearance, and transitions to the 'hasNPC' state.

state hasNPC: This state is entered when an NPC exists. It sets a timer event for 5 seconds. 
When the timer event triggers, it checks the value of the 'move' variable. If it's TRUE, 
it stops the NPC's movement towards the target using osNpcStopMoveToTarget, sets a timer event for 3 seconds, resets the 'move' variable. 
If the 'move' variable is not TRUE, it checks the value of the 'step' variable. If it's FALSE, it makes the NPC say "Hello world!" and sets the 'step' variable to TRUE. 
Then, it makes the NPC move to the target position using osNpcMoveToTarget, sets a timer event for 1 second, and sets the 'move' variable to TRUE. 
If the NPC is touched, it stops the NPC's movement, makes the NPC say "Goodbye!", removes the NPC, resets the 'npc' variable, and transitions back to the 'default' state.

This script demonstrates the creation, manipulation, and removal of an NPC, 
as well as the usage of osNpcMoveToTarget and osNpcStopMoveToTarget to make the NPC move to a target position and stop its movement respectively. 
Additionally, it introduces variables 'move' and 'step' to control the NPC's movement and behavior.
*/

// osNpcStopMoveToTarget Script Exemple
// Author: djphil
 
key npc; // Declares a key variable named 'npc'.
integer move; // Declares an integer variable named 'move'.
integer step; // Declares an integer variable named 'step'.

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcStopMoveToTarget usage."); // Sends a message to the public channel.
    }

    touch_start(integer number)
    {
        key toucher = llDetectedKey(0); // Retrieves the key of the touching avatar.
        vector npcPos = llGetPos() + <-5.0, -1.0, 1.0>; // Calculates the position for the NPC.
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
        if (move == TRUE) // If the 'move' variable is TRUE.
        {
            osNpcStopMoveToTarget(npc); // Stops the NPC's movement towards the target.
            llSetTimerEvent(3.0); // Sets a timer event for 3 seconds.
            move = FALSE; // Resets the 'move' variable.
        }
        else // If the 'move' variable is not TRUE.
        {
            if (step == FALSE) // If the 'step' variable is FALSE.
            {
                osNpcSay(npc, "Hello world!"); // Makes the NPC say "Hello world!".
                step = TRUE; // Sets the 'step' variable to TRUE.
            }

            osNpcMoveToTarget(npc, llGetPos() + <5.0, -1.0, 0.0>, OS_NPC_NO_FLY); // Makes the NPC move to the target position.
            llSetTimerEvent(1.0); // Sets a timer event for 1 second.
            move = TRUE; // Sets the 'move' variable to TRUE.
        }
    }

    touch_start(integer number)
    {
        llSetTimerEvent(0.0); // Resets the timer event.
        osNpcSay(npc, "Goodbye!"); // Makes the NPC say "Goodbye!".
        osNpcRemove(npc); // Removes the NPC.
        npc = NULL_KEY; // Resets the 'npc' variable.
        state default; // Transitions back to the 'default' state.
    }
}
