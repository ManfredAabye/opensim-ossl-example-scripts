/*
string osLoadedCreationDate()
When an avatar touches the object containing this script, 
it will output information about the object's creation date, creation time, and creation ID into the chat. 
This can be useful for debugging purposes or for providing information about the object's history.
*/

//Example osLoadedCreationDate
 
default
{
    touch_start(integer num)
    {
        // Retrieve creation date, time, and ID and store them in a string
        string data = "\n\n Creation Date: " + osLoadedCreationDate();
        data += "\n Creation Time: " + osLoadedCreationTime();
        data += "\n Creation ID: " + osLoadedCreationID();

        // Output the information into the chat
        llSay(0, data);
    }
}
