/*
integer osStringStartsWith(string src, string start, integer ignore_case)
Returns 1 if the string in src starts with the characters in start. Case is ignored if ignore_case is 1 otherwise the case of the characters matters.
*/

// Example use of osStringStartsWith
 
// Function to test if a string starts with a specified substring, optionally ignoring case
do_test(string s, string start, integer ignore_case)
{
    integer found;
    string result = "";
 
    // Check if the string 's' starts with the substring 'start', optionally ignoring case
    found = osStringStartsWith(s, start, ignore_case);
    
    // Construct a result string based on the outcome of the test
    if (found != 0)
        result = "string " + s + " starts with " + start;
    else
        result = "string " + s + " does not start with " + start;
    
    // Add information about whether case was ignored in the comparison
    if (ignore_case)
        result += " (ignoring case)";
    
    // Display the result
    llOwnerSay(result);
}
 
// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch me to see examples of osStringStartsWith");
    }
 
    // This event is triggered when an avatar touches the object containing this script
    touch_start(integer n)
    {
        // Define the source string for testing
        string src = "abcdef";
 
        // Perform tests using the do_test function with different parameters
        do_test(src, "ab", 0); // Case-sensitive check: 'ab' is found at the beginning of 'src'
        do_test(src, "AB", 0); // Case-sensitive check: 'AB' is not found at the beginning of 'src'
        do_test(src, "AB", 1); // Case-insensitive check: 'AB' is found at the beginning of 'src'
        do_test(src, "cd", 1); // Case-insensitive check: 'cd' is found at the beginning of 'src'
    }
}
