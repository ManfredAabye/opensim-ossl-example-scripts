/*
integer osConsoleCommand(string command)
    The provided script demonstrates the usage of the osConsoleCommand() function, which allows an LSL script to directly execute a command to OpenSim's console.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the touch_start() event handler is triggered when the object is touched.

    Inside the touch_start() event handler, the script uses osConsoleCommand() to execute the command "login disable", which disables logins to the OpenSim region.

    It then notifies in local chat that logins are disabled.

    The script emphasizes the severe security threat posed by this function and warns against its usage unless one is absolutely sure of what they're doing.
*/

//
// osConsoleCommand Script Example
//

default
{
    touch_start(integer num_detected)
    {
        // Disable logins using osConsoleCommand
        osConsoleCommand("login disable");

        // Notify in local chat that logins are disabled
        llSay(0, "Logins are disabled");
    }
}
