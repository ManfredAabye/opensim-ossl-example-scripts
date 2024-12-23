/*
string osLoadedCreationID()
When an avatar touches the object containing this script, it triggers the touch_start event. 
Inside this event, the script retrieves the creation date, creation time, 
and creation ID of the object or script using the OSSL functions osLoadedCreationDate(), osLoadedCreationTime(), and osLoadedCreationID() respectively. 
Then, it constructs a string data containing this information, with each piece of information separated by new lines (\n). 
Finally, it uses llSay() to output this data to the chat on channel 0.
*/

//Example osLoadedCreationID
 
default
{
    touch_start(integer num)
    {
        // Initialize an empty string to store the data
        string data = "\n\n Creation Date: " + osLoadedCreationDate(); // Retrieve and append creation date
        data += "\n Creation Time: " + osLoadedCreationTime(); // Retrieve and append creation time
        data += "\n Creation ID: " + osLoadedCreationID(); // Retrieve and append creation ID

        // Output the data to chat
        llSay(0, data);
    }
}
