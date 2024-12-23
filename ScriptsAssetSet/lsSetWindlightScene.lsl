/*
This script demonstrates the usage of the lsSetWindlightScene function, which sets Windlight settings in the scene to new values. 
Upon initialization, the script sends a message to the public channel instructing users to touch the object to see the usage. 
Upon touch, the script switches between a default water color and a randomly generated color, 
sets the new water color using lsSetWindlightScene, and informs users about the success or failure of the operation.
*/

//
// lsSetWindlightScene Script Example
// Author: djphil
//

integer switch; // Variable to switch between colors

default
{
    // Event handler triggered when the script is initialized
    state_entry()
    {
        // Send a message to public channel informing users to touch to see usage
        llSay(PUBLIC_CHANNEL, "Touch to see lsSetWindlightScene usage.");
        // Set text above the object to indicate the script's function
        llSetText("lsSetWindlightScene", <1.0, 1.0, 1.0>, 1.0);
    }

    // Event handler triggered when the object is touched
    touch_start(integer number)
    {
        vector color = <4.0, 38.0, 64.0>; // Default color

        // Switch between default color and random color
        if (switch = !switch)
        {
            color = <llFrand(255.0), llFrand(255.0), llFrand(255.0)>; // Generate a random color
        }

        // Define settings list with water color setting
        list settings = [WL_WATER_COLOR, color];

        // Call lsSetWindlightScene function to set the Windlight scene with the new settings
        integer result = lsSetWindlightScene(settings);

        // Check if the settings were applied successfully
        if (result == TRUE)
        {
            // Notify users about the success and display the current water color
            llSay(PUBLIC_CHANNEL, "The Windlight Scene was changed with success.");
            llSay(PUBLIC_CHANNEL, "The current water color is: " + (string)color);
        }
        else
        {
            // Notify users about the failure to change the Windlight Scene
            llSay(PUBLIC_CHANNEL, "The Windlight Scene was changed without success.");
        }
    }
}
