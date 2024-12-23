/*
string osGetApparentRegionTimeString(integer format24)
This function retrieves the current apparent sun time of the region as a formatted string.
*/

//
// osGetApparentRegionTimeString() example
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the current apparent sun time of the region as a formatted string using osGetApparentRegionTimeString().
        // The 'format24' parameter specifies whether to use a 24-hour format (1) or a 12-hour format (0).
        string apparent_time_string = osGetApparentRegionTimeString(1); // Using 24-hour format.

        // Display the current apparent sun time as a formatted string.
        llSay(0, "Current Apparent Sun Hour: " + apparent_time_string);
    }
}
