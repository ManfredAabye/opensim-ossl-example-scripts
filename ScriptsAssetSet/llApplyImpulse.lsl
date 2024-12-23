/*
This script retrieves the position of the object owned by the script owner using llGetObjectDetails() with the OBJECT_POS parameter. 
If the position is successfully retrieved, it enables physics on the current object, 
calculates the direction vector from the owner's object to the current object, 
and applies an impulse to the current object in that direction with a magnitude of 100.
*/

// Define the default state
default
{
    // Event handler for state entry
    state_entry()
    {
        // Get details about the object owned by the script owner
        list p = llGetObjectDetails(llGetOwner(), [OBJECT_POS]);

        // Check if the details are retrieved successfully
        if (p != [])
        {
            // Enable physics on the object
            llSetStatus(STATUS_PHYSICS, TRUE);

            // Extract the position of the owner's object from the retrieved details
            vector pos = llList2Vector(p, 0);

            // Calculate the direction vector from the owner's object to the current object
            vector direction = llVecNorm(pos - llGetPos());

            // Apply an impulse to the object in the calculated direction with a magnitude of 100
            llApplyImpulse(direction * 100, 0);
        }
    }
}

