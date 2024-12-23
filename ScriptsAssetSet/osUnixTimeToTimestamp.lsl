/*
string osUnixTimeToTimestamp(integer epoch);
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code.
*/

//
// osUnixTimeToTimestamp Script Example
// Author: djphil
//
 
// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch to see osUnixTimeToTimestamp usage.");
    }
 
    // This event is triggered when an avatar touches the object
    touch_start(integer number)
    {
        // Get the current Unix time (epoch time)
        integer epoch = llGetUnixTime();
        
        // Convert the Unix time to a human-readable timestamp and send it to the public chat channel
        llSay(PUBLIC_CHANNEL, "Clicked at " + osUnixTimeToTimestamp(epoch));
    }
}
