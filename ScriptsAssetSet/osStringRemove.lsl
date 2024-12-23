/*
string osStringRemove(string src, integer offset, integer count)
When an avatar touches the object, this script executes the osStringRemove function to remove characters from the source string 'abcdef' starting from index 0 up to index 3 (exclusive). The result is then displayed using llOwnerSay.
*/

// Example of osStringRemove
 
// This script demonstrates the usage of the osStringRemove function in OpenSim.

// Define the default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch me to show osStringRemove");
    }
 
    // This event is triggered when an avatar touches the object containing this script
    touch_start(integer n)
    {
        // Define the source string from which characters will be removed
        string src = "abcdef";
        
        // Remove characters from the source string starting from index 0 up to index 3 (exclusive)
        // osStringRemove function removes characters from the source string based on the specified range
        string sub = osStringRemove(src, 0, 3);
        
        // Display the result of removing characters from the source string
        // Concatenate strings to form a message that includes the original and modified strings
        llOwnerSay("osStringRemove(src, 0, 3) of \"" + src + "\" is \"" + sub + "\"");
    }
}
