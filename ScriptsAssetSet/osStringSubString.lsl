/*
string osStringSubString(string src, integer offset)
string osStringSubString(string src, integer offset, integer length)
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code.
*/

// Example of osStringSubString
 
// This script demonstrates the usage of the osStringSubString function in OpenSim.

// Define the default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch me to show osStringSubString");
    }
 
    // This event is triggered when an avatar touches the object containing this script
    touch_start(integer n)
    {
        // Define the source string from which the substring will be extracted
        string src = "abcdef";
        
        // Extract a substring from 'src' starting at index 1 (second character)
        string sub = osStringSubString(src, 1);
        
        // Display the result of extracting the substring
        llOwnerSay("osStringSubString(src, 1) of \"" + src + "\" is \"" + sub + "\"");
        
        // Extract a substring from 'src' starting at index 1 (second character) and containing 2 characters
        sub = osStringSubString(src, 1, 2);
        
        // Display the result of extracting the substring
        llOwnerSay("osStringSubString(src, 1, 2) of \"" + src + "\" is \"" + sub + "\"");
    }
}
