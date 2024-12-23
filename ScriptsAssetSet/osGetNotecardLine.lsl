/*
string osGetNotecardLine(string name, integer line)
This script demonstrates the usage of osGetNotecardLine function to read each line of a notecard.
*/

// osGetNotecardLine example

default 
{
    state_entry()
    {
        // Declare variables
        integer i;
        string notecard_name = llGetInventoryName(INVENTORY_NOTECARD, 0); // Get the name of the first notecard in the prim's inventory
        integer notecard_line = osGetNumberOfNotecardLines(notecard_name); // Get the total number of lines in the notecard
 
        // Loop through each line of the notecard
        for(i = 0; i < notecard_line; ++i)
        {
            // Retrieve and trim each line of the notecard, then say it in the public chat
            llSay(PUBLIC_CHANNEL, llStringTrim(osGetNotecardLine(notecard_name, i), STRING_TRIM));
        }
    }
}
