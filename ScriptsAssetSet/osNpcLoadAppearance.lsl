/*
osNpcLoadAppearance(key npc, string notecard)
    In the state_entry() event:
        It gets the total number of appearance notecards in the primitive's inventory using llGetInventoryNumber().
        It checks if there is at least one appearance notecard in the inventory. If not, it informs users.
        If there is at least one appearance notecard, it instructs users to collide an NPC with the primitive to see the usage of osNpcLoadAppearance.
    In the collision_start() event:
        It gets the key of the collider (the object colliding with the primitive) using llDetectedKey().
        It checks if the collider is an NPC using osIsNpc().
        If the collider is an NPC, it selects a random appearance notecard from the inventory and loads it onto the NPC using osNpcLoadAppearance().
        It makes the NPC say a message indicating it has a new appearance.
        If the collider is not an NPC, it informs users that only NPCs can collide with the primitive and load a new appearance.
*/

// osNpcLoadAppearance Script Exemple
// Author: djphil
 
integer total; // Variable to store the total number of appearance notecards in the primitive's inventory

default
{
    state_entry()
    {
        // Get the total number of appearance notecards in the primitive's inventory
        total = llGetInventoryNumber(INVENTORY_NOTECARD);

        // Check if there is at least one appearance notecard in the inventory
        if (total < 1)
        {
            // If there are no appearance notecards, inform users
            llSay(PUBLIC_CHANNEL, "The inventory of this primitive must contain at least one appearance notecard for an NPC.");
        }
        else
        {
            // If there is at least one appearance notecard, instruct users to collide an NPC with the primitive
            llSay(PUBLIC_CHANNEL, "Collide an NPC with this primitive to see osNpcLoadAppearance usage.");
        }
    }

    collision_start(integer number)
    {
        // Get the key of the collider (the object colliding with the primitive)
        key collider = llDetectedKey(0);

        // Check if the collider is an NPC
        if (osIsNpc(collider))
        {
            // If the collider is an NPC, select a random appearance notecard from the inventory
            integer random = llFloor(llFrand((float)total));
            string notecard = llGetInventoryName(INVENTORY_ALL, random);
            
            // Load the selected appearance notecard onto the NPC
            osNpcLoadAppearance(collider, notecard);
            
            // Make the NPC say a message indicating it has a new appearance
            osNpcSay(collider, "Wow cool, I have a new appearance now!");
        }
        else
        {
            // If the collider is not an NPC, inform users
            llSay(PUBLIC_CHANNEL, "Only NPCs can collide with me and load a new appearance.");
        }
    }
}
