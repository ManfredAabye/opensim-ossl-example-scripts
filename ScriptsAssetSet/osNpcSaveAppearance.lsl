/*
key osNpcSaveAppearance(key npc, string notecard)
When an NPC collides with the object containing this script, it attempts to save its appearance into a notecard. If the save operation is successful, 
the NPC is informed about the successful save operation. 
If not successful, the NPC is informed about the unsuccessful save operation. If the collider is not an NPC, users are informed that only NPCs can trigger this functionality.
*/

// osNpcSaveAppearance Script Exemple
// Author: djphil
 
default
{
    state_entry()
    {
        // Sends a message to the public channel instructing users to collide an NPC with the object
        // to see the usage of osNpcSaveAppearance.
        llSay(PUBLIC_CHANNEL, "Collide an NPC with this primitive to see osNpcSaveAppearance usage.");
    }

    collision_start(integer number)
    {
        // Get the key of the collider
        key collider = llDetectedKey(0);

        // Check if the collider is an NPC
        if (osIsNpc(collider))
        {
            // Attempt to save the appearance of the NPC into a notecard
            key result = osNpcSaveAppearance(collider, (string)collider);

            // Check if the save operation was successful
            if (result && result != NULL_KEY)
            {
                // If successful, inform the NPC about the successful save operation
                osNpcSay(collider, "Notecard \"" + (string)collider + "\" saved successfully.");
            }
            else
            {
                // If not successful, inform the NPC about the unsuccessful save operation
                osNpcSay(collider, "Notecard \"" + (string)collider + "\" not saved successfully.");
            }
        }
        else
        {
            // If the collider is not an NPC, inform users that only NPCs can trigger this functionality
            llSay(PUBLIC_CHANNEL, "Only NPCs can collide with this object and save their appearance in a notecard.");
        }
    }
}
