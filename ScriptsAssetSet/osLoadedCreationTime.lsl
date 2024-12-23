/*
string osLoadedCreationTime()
    When an avatar touches the object containing this script, it triggers the touch_start event.
    Inside the touch_start event, the script constructs a string data that includes the creation date, creation time, and creation ID.
    The creation date, creation time, and creation ID are obtained using the OSSL (OpenSim Scripting Language) functions osLoadedCreationDate(), osLoadedCreationTime(), and osLoadedCreationID() respectively.
    Each piece of information is appended to the data string with a new line character (\n) to separate them visually.
    Finally, the script uses llSay() to output the data string to the chat on channel 0, which is the default chat channel for public communication in OpenSim.
*/


//Example osLoadedCreationTime
 
default
{
    touch_start(integer num)
    {
        // Initialize an empty string to store the data
        string data = "\n\n Creation Date: " + osLoadedCreationDate(); // Retrieve and append creation date
        data += "\n Creation Time: " + osLoadedCreationTime(); // Retrieve and append creation time
        data += "\n Creation ID: " + osLoadedCreationID(); // Retrieve and append creation ID

        // Output the data to the chat on channel 0
        llSay(0, data);
    }
}
