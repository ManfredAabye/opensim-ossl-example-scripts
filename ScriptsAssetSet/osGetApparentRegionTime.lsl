/*
float osGetApparentRegionTime()
This function retrieves the current apparent sun time of the region.
*/

//
// osGetApparentRegionTime() example
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the current apparent sun time of the region using osGetApparentRegionTime().
        float apparent_time = osGetApparentRegionTime();

        // Display the current apparent sun time as a string.
        llSay(0, "Current Apparent Sun Time: " + (string)apparent_time);
    }
}
