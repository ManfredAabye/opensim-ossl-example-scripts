/*
    In the state_entry() event, the object sends a message to the public channel indicating that it needs to be touched to initiate the script.
    When the object is touched (touch_end() event), it defines a sentence sSentence in which to search for matching strings.
    It initializes an empty list lMatches to store the matched strings.
    Using osMatchString() function, it finds all occurrences of the substring "all" within sSentence. The last parameter 0 indicates that the search is case-sensitive.
    The matched strings are then converted into a formatted string using llDumpList2String() for display purposes.
    Finally, the matched strings are displayed in local chat (channel 0) using llSay().
*/


// Example of osMatchString

default
{
    state_entry()
    {
        // When the object enters the default state, it sends a message to the public channel
        // instructing users to touch it to initiate the script.
        llSay(PUBLIC_CHANNEL, "Touch me to show Matched Strings");
    }
 
    touch_end(integer total_number)
    {
        // Define the sentence in which to search for matching strings
        string sSentence = "today we do this all day long and all night long";
        
        // Initialize an empty list to store the matched strings
        list lMatches = [];
        
        // Use the osMatchString function to find all occurrences of the substring "all"
        // within the sentence. The last parameter (0) indicates a case-sensitive search.
        lMatches = osMatchString(sSentence, "all", 0);
        
        // Convert the list of matched strings into a formatted string for display
        string matchedStrings = llDumpList2String(lMatches, " @ ");
        
        // Display the matched strings in local chat (channel 0)
        llSay(0, "Matched String :\n" + matchedStrings);  
    }
}
