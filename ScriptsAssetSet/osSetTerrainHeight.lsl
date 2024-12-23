/*
integer osSetTerrainHeight(integer x, integer y, float val)
    default: This is a default event handler in OpenSim scripts.
    touch_start(): This event is triggered when an object associated with this script is touched.
    osSetTerrainHeight(40, 101, 21.4);: This function sets the height of the terrain at the specified coordinates (40, 101) to 21.4 meters. 
    The coordinates are specified in the form of (X, Y) where X represents the east-west direction and Y represents the north-south direction.
    osTerrainFlush();: This function flushes the terrain changes, effectively applying the height modifications made using osSetTerrainHeight().

In summary, when the object associated with this script is touched, it modifies the height of the terrain at the specified coordinates and then refreshes the terrain to apply the changes.
*/

// Example osSetTerrainHeight

default
{
    touch_start()
    {
        osSetTerrainHeight(40, 101, 21.4); // Sets the height of the terrain at coordinates (40, 101) to 21.4 meters
        osTerrainFlush(); // Refreshes the terrain to apply the height changes
    }
}
