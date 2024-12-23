/*
integer osStringLastIndexOf(string src, string value, integer ignoreCase)
Reports the zero-based index of the last occurrence of string value withing string scr. returns -1 if not found. It can compare ignoring case with ignoreCase TRUE(1) or considering case if FALSE(0);
*/

// Example of osStringLastIndexOf
 
// This script demonstrates the usage of the osStringLastIndexOf function in OpenSim.
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch me to show osStringLastIndexOf");
    }
 
    // This event is triggered when an avatar touches the object containing this script
    touch_start(integer n)
    {
        // Define the source string to search within
        string src = "abcdefDeg";
        // Define the substring to search for
        string val = "DE";
        // Find the index of the last occurrence of the substring within the source string
        // The osStringLastIndexOf function returns the index of the last occurrence of the substring within the source string
        // If the substring is not found, it returns -1
        // The third parameter 'TRUE' indicates that the search is case sensitive
        llOwnerSay((string)osStringLastIndexOf(src, val, TRUE));
    }
}
