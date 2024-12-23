/*
osNpcRemove(key npc)
When touched, this script retrieves a list of NPCs in the simulation and iterates through each one, 
making them say "Goodbye!" before removing them using osNpcRemove(). Finally, it informs users about the removal of each NPC.
*/

// osNpcRemove Script Exemple
// Author: djphil
 
default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to touch the object
        // to see the usage of osNpcRemove.
        llSay(PUBLIC_CHANNEL, "Touch to see osNpcRemove usage.");
    }

    touch_start(integer number)
    {
        // Get a list of NPCs currently present in the simulation
        list npcs = llList2ListStrided(osGetNPCList(), 0, -1, 3);

        // Check if the list is empty
        if (npcs == [])
        {
            // If there are no NPCs in the simulation, inform the user
            llSay(PUBLIC_CHANNEL, "There are no NPCs in this sim currently.");
        }
        else
        {
            // If there are NPCs in the simulation, loop through each NPC and remove them
            integer length = llGetListLength(npcs);
            integer i;

            for (i = 0; i < length; i++)
            {
                // Get the key of the NPC
                key npc = llList2Key(npcs, i);

                // Inform users about the NPC being removed
                llSay(PUBLIC_CHANNEL, "Removing NPC: " + (string)npc + " (" + llKey2Name(npc) + ").");

                // Make the NPC say "Goodbye!"
                osNpcSay(npc, "Goodbye!");

                // Remove the NPC
                osNpcRemove(npc);
            }
        }
    }
}
