/*
This script demonstrates the usage of the lsGetWindlightScene function, which retrieves Windlight settings from the scene based on specified rules. 
When initialized, the script sends a message to the public channel instructing users to touch the object to see the usage. 
Upon touch, the script calls lsGetWindlightScene to retrieve the water color setting and displays it in the public channel.
*/

//
// lsGetWindlightScene Script Example
// Author: djphil
//

default
{
    // Event handler triggered when the script is initialized
    state_entry()
    {
        // Send a message to public channel informing users to touch to see usage
        llSay(PUBLIC_CHANNEL, "Touch to see lsGetWindlightScene usage.");
    }

    // Event handler triggered when the object is touched
    touch_start(integer number)
    {
        // Define a list of rules to retrieve Windlight settings (e.g., water color)
        list rules = [WL_WATER_COLOR];

        // Call lsGetWindlightScene function to retrieve Windlight settings based on the rules
        list settings = lsGetWindlightScene(rules);

        // Extract the water color setting from the retrieved settings list and display it
        llSay(PUBLIC_CHANNEL, "The current water color is: " + llList2String(settings, 1));
    }
}
