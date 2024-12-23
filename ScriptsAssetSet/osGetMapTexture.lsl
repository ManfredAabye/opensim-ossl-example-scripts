/*
key osGetMapTexture()
This script sets the texture of the prim to the texture used for the world map on all sides when the script initializes.
*/


// Example of osGetMapTexture

default
{
    state_entry()
    {
        // Set the world map texture to all sides of the prim
        llSetTexture(osGetMapTexture(), ALL_SIDES);
    }
}
