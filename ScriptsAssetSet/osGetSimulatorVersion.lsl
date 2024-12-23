/*
    In the state_entry event, the script initializes by displaying a message in chat prompting to touch the object to get the simulator version information.
    In the touch_end event, when an avatar touches the object, the script retrieves the simulator version information using osGetSimulatorVersion. It then sends an instant message to the avatar who touched the object, containing the simulator version information.
*/

// Example of osGetSimulatorVersion()

default
{
    state_entry() // display @ start
    {
        // Display a message prompting to touch the object to get the simulator version information
        llSay(0, "Touch me to get the Simulator Version Information using osGetSimulatorVersion");
    }

    touch_end(integer num) // Tell toucher our version
    {
        // Get the simulator version information
        string version = osGetSimulatorVersion();
        
        // Send an instant message to the avatar who touched the object with the simulator version information
        llInstantMessage(llDetectedKey(0), "Simulator Version: " + version);
    }
}
