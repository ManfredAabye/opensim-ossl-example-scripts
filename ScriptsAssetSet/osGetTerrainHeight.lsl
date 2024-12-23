/*
float osGetTerrainHeight(integer x, integer y)
This script allows users to manipulate the terrain height in an OpenSim environment by touching an object. When touched, it increases the terrain height by 4.5 units, and when touched again, 
it restores the terrain height to its original value at the specified coordinates (iX, iY). The script demonstrates the use of osSetTerrainHeight and osGetTerrainHeight functions for terrain manipulation.
*/

// Script Title:    osSetTerrainHeight_osGetTerrainHeight.lsl
// Script Author:   WhiteStar Magic

// Flag to track if the object has been touched
integer touched = FALSE;

// Coordinates for terrain manipulation
integer iX = 128;
integer iY = 128;

// Variable to store current terrain height
float CurValue;

// Default event handler
default
{
    state_entry()
    {
        // Display instructions when the script initializes
        llSay(0,"Touch to see osSetTerrainHeight & osGetTerrainHeight work.");
        
        // Get the current terrain height at the specified coordinates
        CurValue = osGetTerrainHeight(iX, iY);
    }
    
    // Event handler for touch end
    touch_end(integer num)
    {
        // Check if the object has been touched
        if(touched)
        {
            // Restore original terrain height
            touched = FALSE;
            osSetTerrainHeight(iX, iY, CurValue);
            llOwnerSay("osSetTerrainHeight @ coordinates X-["+(string)iX+"] Y-["+(string)iY+"] set to ["+(string)osGetTerrainHeight(iX, iY)+"]");
        }
        else
        {
            // Increase terrain height
            touched = TRUE;
            float NewValue = CurValue + 4.5;
            osSetTerrainHeight(iX, iY, NewValue);
            llOwnerSay("osSetTerrainHeight @ coordinates X-["+(string)iX+"] Y-["+(string)iY+"] set to ["+(string)osGetTerrainHeight(iX, iY)+"]\nTouch to restore to Original Height");
        }
    }
}
