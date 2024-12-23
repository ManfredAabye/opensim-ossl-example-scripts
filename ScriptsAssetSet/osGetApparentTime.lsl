/*
float osGetApparentTime()
This function retrieves the current apparent time in the OpenSim environment.
*/

//
// osGetCurrentSunHour() example, by Tom Earth.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the current apparent time using osGetApparentTime().
        float apparent_time = osGetApparentTime();

        // Display the current apparent time as a string.
        llSay(0, "Current Apparent SunTime: " + (string)apparent_time);
    }
}
