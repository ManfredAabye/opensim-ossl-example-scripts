/*
string osDetectedCountry(integer index)
    The provided script demonstrates the usage of the osDetectedCountry() function, which returns a string indicating the country in which the avatar is located.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It notifies in local chat that the script is running.

    The touch_end() event handler is triggered when the object is touched. Inside this event handler, the script calls osDetectedCountry(0) to retrieve the country where the avatar is located.

    It then notifies in local chat about the detected country using the retrieved country string.
*/

//
// Sample script using osDetectedCountry
// 

default
{
    state_entry()
    {
        // Notify in local chat that the script is running
        llSay(0, "Script running");
    }

    touch_end(integer num)
    {
        // Get the country in which the avatar is located
        string country = osDetectedCountry(0);

        // Notify in local chat about the detected country
        llSay(0, "You are in country " + country);
    }
}
