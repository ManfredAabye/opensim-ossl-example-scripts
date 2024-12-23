/*
float osGetCurrentSunHour()
This function retrieves the current sun hour in the OpenSim environment.
*/

//
// osGetCurrentSunHour() example, by Tom Earth.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the current sun hour using osGetCurrentSunHour().
        float current_sun_hour = osGetCurrentSunHour();

        // Display the current sun hour as a string.
        llSay(0, "Current sun hour: " + (string)current_sun_hour);
    }
}
