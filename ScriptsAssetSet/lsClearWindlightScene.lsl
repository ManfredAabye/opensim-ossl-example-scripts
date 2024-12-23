/*
This script demonstrates the usage of the lsClearWindlightScene function, which removes Windlight settings from a region. 
The script sends a message to the public channel when initialized, instructing users to touch the object to see the usage. 
Upon touch, the lsClearWindlightScene function is called, 
and a confirmation message is sent to the public channel indicating that the Windlight scene is cleared.
*/

//
// lsClearWindlightScene Script Example
// Author: djphil
//

default
{
    // Event handler triggered when the script is initialized
    state_entry()
    {
        // Send a message to public channel informing users to touch to see usage
        llSay(PUBLIC_CHANNEL, "Touch to see lsClearWindlightScene usage.");
    }

    // Event handler triggered when the object is touched
    touch_start(integer number)
    {
        // Call lsClearWindlightScene function to remove Windlight settings
        lsClearWindlightScene();
        
        // Send a message to public channel confirming the Windlight scene is cleared
        llSay(PUBLIC_CHANNEL, "The Windlight Scene is now cleared ...");
    }
}
