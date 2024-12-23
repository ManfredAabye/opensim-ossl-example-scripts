/*
integer osRegexIsMatch(string input, string pattern)
    string check_string(string input, string pattern): This function takes two string parameters: input (the string to be checked) and pattern (the regular expression pattern to match against). It uses the osRegexIsMatch function to determine if the input string matches the specified pattern. If there's a match, it returns a message indicating success; otherwise, it returns a message indicating failure.

    default: This is the default state where the script starts. In the state_entry event, it sends a message to the public channel instructing users to touch for demonstrating the usage of osRegexIsMatch.

    touch_start: This event is triggered when the object is touched by an avatar. In this script, it calls the check_string function multiple times with different input strings and regular expression patterns to demonstrate various matching scenarios for lowercase letters (a-z), uppercase letters (A-Z), and numbers (0-9).

Overall, this script illustrates how to use the osRegexIsMatch function to perform regular expression matching in OpenSim.
*/

// osRegexIsMatch Script Example
// Author: djphil

 
string check_string(string input, string pattern)
{
    if (osRegexIsMatch(input, pattern))
    {
        return "The input string \"" + input + "\" matches with the regular expression pattern \"" + pattern + "\"";
    }
 
    else
    {
        return "The Input string \"" + input + "\" do not matches with the regular expression pattern \"" + pattern + "\"";
    }
}
 
default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osRegexIsMatch usage.");
    }
 
    touch_start(integer number)
    {
        // Check lowercase from a to z
        llSay(PUBLIC_CHANNEL, check_string("abcdef", "[a-z]"));
        llSay(PUBLIC_CHANNEL, check_string("ABCDEF", "[a-z]"));
        llSay(PUBLIC_CHANNEL, check_string("123456", "[a-z]"));
 
        // Check uppercase from A to Z
        llSay(PUBLIC_CHANNEL, check_string("abcdef", "[A-Z]"));
        llSay(PUBLIC_CHANNEL, check_string("ABCDEF", "[A-Z]"));
        llSay(PUBLIC_CHANNEL, check_string("123456", "[A-Z]"));
 
        // Check numbers from 0 to 9
        llSay(PUBLIC_CHANNEL, check_string("abcdef", "[0-9]"));
        llSay(PUBLIC_CHANNEL, check_string("ABCDEF", "[0-9]"));
        llSay(PUBLIC_CHANNEL, check_string("123456", "[0-9]"));
    }
}
