/*
integer osGetNumberOfNotecardLines(string name)
This script will retrieve the name of the first notecard in the object's inventory, 
then use osGetNumberOfNotecardLines to get the number of lines in that notecard. Finally, it will output the result to chat. 
Note that this script assumes there is at least one notecard in the object's inventory. 
If there are none, it may not produce the expected result.
*/

// osGetNumberOfNotecardLines example

default
{
    state_entry()
    {
        // Get the name of the first notecard in the object's inventory
        string notecard = llGetInventoryName(INVENTORY_NOTECARD, 0);
        
        // Get the number of lines in the notecard
        integer length = osGetNumberOfNotecardLines(notecard);
        
        // Output the number of lines in the notecard to chat
        llSay(0, "NumberOfNotecardLines is: " + (string)length);
    }
}
