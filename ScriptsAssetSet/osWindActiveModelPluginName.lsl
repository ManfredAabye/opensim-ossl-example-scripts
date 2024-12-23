/*
string osWindActiveModelPluginName()
This script demonstrates basic usage of the osWindActiveModelPluginName() function, which retrieves the name of the active wind model plugin being used in the OpenSim region. 
When the object is touched, it will send a message to the public chat channel displaying the name of the active wind model plugin.
*/

//
// osWindActiveModelPluginName Script Example
//
 
default
{
    // This function is called when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to use the object
        llSay(PUBLIC_CHANNEL, "Touch to see osWindActiveModelPluginName usage.");
    }
 
    // This function is called when the object is touched
    touch_start(integer number)
    {
        // Retrieve the name of the active wind model plugin and send it to the public chat channel
        llSay(PUBLIC_CHANNEL, "The wind active model plugin name is \"" + osWindActiveModelPluginName() + "\".");         
    }
}
