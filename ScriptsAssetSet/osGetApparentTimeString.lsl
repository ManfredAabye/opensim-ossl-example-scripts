/*
string osGetApparentTimeString(integer format24)
This function retrieves the current apparent time in the OpenSim environment as a formatted string.
*/

//
// osGetApparentTimeString() example
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the current apparent time in the OpenSim environment as a formatted string using osGetApparentTimeString().
        // The 'format24' parameter specifies whether to use a 24-hour format (1) or a 12-hour format (0).
        string apparent_time_string = osGetApparentTimeString(1); // Using 24-hour format.

        // Display the current apparent time as a formatted string.
        llSay(0, "Current Apparent Sun Hour: " + apparent_time_string);
    }
}
