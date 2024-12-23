/*
integer osStringIndexOf(string src, string value, integer ignoreCase)
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code.
*/

// Example of osStringRemove
 
// This script demonstrates the usage of the osStringIndexOf function in OpenSim.
// When touched, it searches for the index of a substring within a source string and displays the result.

default
{
    state_entry()
    {
        // Display a message when the object is initialized
        llSay(PUBLIC_CHANNEL, "Touch me to show osStringIndexOf");
    }
 
    touch_start(integer n)
    {
        // Define the source string and the substring to search for
        string src = "abcdef";
        string val = "DE";
        
        // Find the index of the substring within the source string
        // osStringIndexOf returns -1 if the substring is not found, TRUE indicates case sensitivity
        llOwnerSay((string)osStringIndexOf(src, val, TRUE));
    }
}
