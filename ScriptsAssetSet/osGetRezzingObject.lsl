/*
key osGetRezzingObject()
When the object containing this script is rezzed, the on_rez event is triggered. 
Within this event, the script calls osGetRezzingObject to retrieve the UUID of the object that rezzed the object containing the script. 
If the rezzing object is known (i.e., its UUID is not NULL_KEY), 
the script outputs messages indicating that the object was rezzed by an object rezzer and provides the UUID and name of the rezzing object. 
If the rezzing object is unknown (i.e., its UUID is NULL_KEY), 
the script outputs messages indicating that the object was rezzed by an agent or an otherwise unknown source.
*/

// osGetRezzingObject Script Example
// Author: djphil
 
default
{
    on_rez(integer param)
    {
        // Get the UUID of the object that rezzed the object containing the script
        key objectID = osGetRezzingObject();
 
        if (objectID == NULL_KEY)
        {
            // If the rezzing object is unknown (e.g., rezzed by an agent)
            llSay(PUBLIC_CHANNEL, "I was rezzed by an agent or otherwise unknown source.");
            llSay(PUBLIC_CHANNEL, "My rezzing object UUID is: " + (string)objectID);
        }
        else
        {
            // If the rezzing object is known (e.g., rezzed by an object rezzer)
            llSay(PUBLIC_CHANNEL, "I was rezzed by an object rezzer.");
            llSay(PUBLIC_CHANNEL, "My rezzing object UUID is: " + (string)objectID);
            llSay(PUBLIC_CHANNEL, "My rezzing object name is: " + llKey2Name(objectID));
        }
    }
}
