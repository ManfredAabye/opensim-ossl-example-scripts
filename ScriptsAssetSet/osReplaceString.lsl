/*
string osReplaceString(string src, string pattern, string replace, integer count, integer start)
    In the state_entry() event handler, an example text string is defined: "ThX big rXd fox jumpXd ovXr thX lazy dog".

    The script then informs the owner of the object (presumably the script owner) about the original string using llOwnerSay().

    The osReplaceString() function is called to replace all occurrences of the uppercase letter "X" with the lowercase letter "e" in the example_text string. The function parameters used are:
        osReplaceString(source, find, replace, count, flags).
        source: The original string to search and replace within.
        find: The substring to search for.
        replace: The substring to replace with.
        count: The maximum number of replacements to perform (-1 means replace all occurrences).
        flags: Additional flags, but it's not used in this example (set to 0).

    The modified example_text string is then shown to the owner using llOwnerSay().

So, the script essentially demonstrates how to use the osReplaceString() function to replace all occurrences of a specified substring within a string and shows the result to the owner of the object containing the script. In this specific case, it replaces all instances of "X" with "e" in the example text.
*/

// osReplaceString usage example

 
default
{
    state_entry()
    {
        // Define an example text
        string example_text = "ThX big rXd fox jumpXd ovXr thX lazy dog";
 
        // Show the owner the string before it's changed
        llOwnerSay("Before : ''"+example_text+"''");
 
        // Replace all the upper case X-es with the lower case letter e
        example_text = osReplaceString(example_text, "X", "e", -1, 0);
 
        // Show the owner the string after it's changed
        llOwnerSay("After : ''"+example_text+"''");        
    }
}
