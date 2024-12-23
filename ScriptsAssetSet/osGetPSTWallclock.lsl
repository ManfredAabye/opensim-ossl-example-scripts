/*
float osGetPSTWallclock()
When this script is executed, it will output the current time in Pacific Standard Time (PST) to the chat. 
This can be useful for various applications where time synchronization or conversion to a specific time zone is necessary in OpenSimulator environments.
*/

// Example of osGetPSTWallclock
default
{
    state_entry()
    {
        // Get the current time in Pacific Standard Time (PST)
        llSay(0, "Started at " + (string)osGetPSTWallclock());
    }
}
