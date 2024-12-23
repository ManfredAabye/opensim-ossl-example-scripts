/*
vector osGetRegionSize()
When an avatar touches the object containing this script, 
it will trigger the touch_start event. Within this event, the script calls osGetRegionSize to retrieve the size of the region where the object is located, 
and then it outputs this size to chat using llSay. 
The size is represented as a vector, which typically consists of three values representing the length, width, and height of the region.
*/

//Example osGetRegionSize

default
{
    touch_start(integer t)
    {
        // Get the size of the region
        vector regionSize = osGetRegionSize();
        
        // Output the size of the region to chat
        llSay(0, "Region size: " + (string)regionSize);
    }
}
