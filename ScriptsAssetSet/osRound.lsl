/*
float osRound(float value, integer ndigits)
This script prompts avatars in public chat to touch the object. 
When an avatar touches the object, it generates a random float value between 0 and 1000, then rounds this value to 3 decimal places using the osRound function. 
Finally, it sends a message to the owner of the object containing the result of the rounding operation.
*/

// Example of osRound
 
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in public chat to prompt avatars to touch the object
        llSay(PUBLIC_CHANNEL, "Touch me to show osRound");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer n)
    {
        // Generate a random float value between 0 and 1000
        float value = llFrand(1000);
        
        // Round the generated value to 3 decimal places using the osRound function
        // osRound(value, decimal_places) rounds a float value to the specified number of decimal places
        float roundedValue = osRound(value, 3);
        
        // Say the result of the rounding operation in the owner's chat
        llOwnerSay("osRound(" + (string)value + ", 3) of \"" + (string)value + "\" is \"" + (string)roundedValue + "\"");
    }
}
