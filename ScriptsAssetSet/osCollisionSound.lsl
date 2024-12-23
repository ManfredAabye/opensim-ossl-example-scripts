/*
osCollisionSound(string impact_sound, float impact_volume)
    The provided script demonstrates the usage of the osCollisionSound() function, which sets the collision sound of an object.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, it first checks if the impact sound is available in the object's inventory. 
    If it's missing, it notifies in public chat. Otherwise, it instructs users to collide with the object to hear the collision sound and sets the collision sound with the specified volume.

    There's a commented-out section providing an alternative example using a UUID instead of the sound's name in the object's inventory. 
    It checks if the provided UUID is valid and sets the collision sound accordingly, or notifies if an invalid UUID is detected.
*/

//
// osCollisionSound Script Example
//

default
{
    state_entry()
    {
        // Get the name of the sound from the object's inventory
        string impact_sound = llGetInventoryName(INVENTORY_SOUND, 0);

        // Check if the impact sound is missing
        if (impact_sound == "")
        {
            // If missing, notify in public chat
            llSay(PUBLIC_CHANNEL, "Inventory sound missing ...");
        }
        else
        {
            // If found, instruct to collide with the object to hear the collision sound
            llSay(PUBLIC_CHANNEL, "Collide this object to hear osCollisionSound running.");

            // Set collision sound to the specified sound with a volume of 1.0
            osCollisionSound(impact_sound, 1.0);
        }
    }
}

/*And with uuid:

//
// osCollisionSound Script Example
//
 
// Can be sound's name in object's inventory or the sound uuid
string impact_sound = "ed124764-705d-d497-167a-182cd9fa2e6c";
 
default
{
    state_entry()
    {
        // Check if the provided impact_sound is a valid UUID
        if (osIsUUID(impact_sound))
        {
            // If valid, instruct to collide with the object to hear the collision sound
            llSay(PUBLIC_CHANNEL, "Collide this object to hear osCollisionSound running.");

            // Set collision sound to the specified UUID with a volume of 1.0
            osCollisionSound(impact_sound, 1.0);
        }
        else
        {
            // If invalid UUID, notify in public chat
            llSay(PUBLIC_CHANNEL, "Invalid uuid detected ...");
        }
    }
}
*/
