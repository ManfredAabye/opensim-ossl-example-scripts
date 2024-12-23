/*
When an avatar touches the object containing this script, it triggers the touch_end event. 
Within this event, the script calls osGetScriptEngineName to retrieve the name of the script engine being used, 
and then it outputs this name to chat using llSay. 
This can be useful for diagnostic purposes or to determine which script engine features are available in the current environment.
*/

// Script Author:   WSM
// Example of osGetScriptEngineName()

default
{
    state_entry()
    {
        llSay(0, "Touch to get Script Engine Name");
    }
    
    touch_end(integer total_num)
    {
        // Get the name of the script engine
        string scriptEngineName = osGetScriptEngineName();
        
        // Output the name of the script engine to chat
        llSay(0, "The Script Engine Name is: " + scriptEngineName);
    }
}
