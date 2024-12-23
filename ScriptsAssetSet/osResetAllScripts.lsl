/*
osResetAllScripts(integer AllLinkSet)
    The script initializes an integer variable AllLinkSet with a value of 0. This variable is used as a parameter for the osResetAllScripts() function.

    In the default event handler:
        The touch_start() event is triggered when the object is touched by an avatar.
        When touched, it calls the osResetAllScripts() function with the parameter AllLinkSet. This function resets all scripts within the linked set of the object.

Overall, this script allows users to reset all scripts within the linked set of the object by simply touching the object. The AllLinkSet parameter is set to 0, indicating that all scripts within the linked set should be reset.
*/

// osResetAllScripts Script Example
 
// This line declares an integer variable named AllLinkSet and initializes it with a value of 0.
integer AllLinkSet = 0;

// This is the default event handler block.
default
{
    // This is the touch_start event function, which is triggered when an object is touched.
    touch_start(integer total_number)
    {
        // This line calls the osResetAllScripts function and passes the AllLinkSet variable as an argument.
        // This function resets all scripts within the same linkset as the object that was touched.
        osResetAllScripts(AllLinkSet);
    }
}

