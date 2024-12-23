/*
    This script listens for touch events and retrieves the first notecard in the prim's inventory.
    It then uses osGetNotecard to read the content of the notecard and displays it in the chat.
*/

// Notes: See Script Source reference for more detailed information
// This sample is full opensource and available to use as you see fit and desire.
// Threat Levels apply to OSSL
// See http://opensimulator.org/wiki/Threat_level

default
{
    state_entry()
    {
        // This function is called when the script is started or reset
        llSay(0, "Touch to see osGetNotecard read in a notecard and display the text retrieved"); 
    }

    touch_end(integer num)
    {
        // This function is called when the prim is touched
        // Get the first notecard in inventory
        string name = llGetInventoryName(INVENTORY_NOTECARD, 0);
        if (name == "") 
        {
            // If no notecard is found, notify the user
            llSay(0, "There is no notecard in prim inventory. Please place a notecard with some text in the prim to display its contents"); 
            return;
        }
        else
        {
            // Retrieve text content of the notecard
            string text = osGetNotecard(name);
            // Display notecard name in owner's chat
            llOwnerSay("NoteCard Name is: " + name);
            // Display notecard content in local chat
            llSay(0, text);
        }
    }
}
