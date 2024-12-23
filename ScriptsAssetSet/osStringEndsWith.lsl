/*
integer osStringEndsWith(string src, string start, integer ignore_case)
    do_test(string s, string start, integer ignore_case): This function takes three parameters: s (the input string to be tested), start (the substring to check if s ends with), and ignore_case (an integer indicating whether case should be ignored during comparison).
    found = osStringEndsWith(s, start, ignore_case);: This line calls the osStringEndsWith function to check if the string s ends with the substring start. If ignore_case is non-zero, case is ignored during comparison.
    The script then constructs a result message based on whether the substring was found at the end of the string and whether case was ignored.
    In the default event handler:
        state_entry(): This event handler is triggered when the script starts running. It sends a message to the public channel, informing users to touch the object to see examples of osStringEndsWith.
        touch_start(integer n): This event handler is triggered when the object associated with the script is touched. It initializes a source string src for testing and calls the do_test function with different test cases to demonstrate the usage of osStringEndsWith.

In summary, this script provides examples of using the osStringEndsWith function to determine whether a string ends with a specified substring, optionally ignoring case sensitivity. It demonstrates the behavior of osStringEndsWith with different input parameters.
*/

// Example use of osStringEndsWith
 
do_test(string s, string start, integer ignore_case)
{
    integer found;
    string result = "";
 
    found = osStringEndsWith(s, start, ignore_case); // Check if the string 's' ends with 'start', optionally ignoring case
    if (found != 0)
        result = "string " + s + " ends with " + start; // If 'start' is found at the end of 's'
    else
        result = "string " + s + " does not end with " + start; // If 'start' is not found at the end of 's'
    if (ignore_case)
        result += " (ignoring case)"; // If case is being ignored
    llOwnerSay(result); // Output the result
}

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch me to see examples of osStringEndsWith"); // Notify users to touch the object
    }

    touch_start(integer n)
    {
        string src = "abcdef"; // Source string for testing

        do_test(src, "ef", 0); // Test if 'src' ends with "ef" (case-sensitive)
        do_test(src, "EF", 0); // Test if 'src' ends with "EF" (case-sensitive)
        do_test(src, "EF", 1); // Test if 'src' ends with "EF" (case-insensitive)
        do_test(src, "ab", 1); // Test if 'src' ends with "ab" (case-insensitive)
        do_test(src, "cef", 0); // Test if 'src' ends with "cef" (case-sensitive)
    }
}
