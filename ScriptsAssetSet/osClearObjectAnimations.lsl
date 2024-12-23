/*
integer osClearObjectAnimations()
    The provided script demonstrates the usage of the osClearObjectAnimations() function, which clears all animations on a prim and returns the number of animations cleared.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and notes about its version.

    In the default state, it has a state_entry() event handler that instructs the user to right-click on the object and select "Touch" to test the osClearObjectAnimations() function.

    When the object is touched (touch_start() event handler), it clears all animations on the object and reports the number of animations cleared in the public chat.

    There's a commented-out section providing an alternative example of how the script could be used, 
    where dropping the script into the object's inventory triggers the animation clearing process. After that, the script automatically removes itself from the object's inventory.
*/

//
// osClearObjectAnimations Script Example
// Author= djphil
//

default
{
    state_entry()
    {
        // Display instructions for testing osClearObjectAnimations usage
        llSay(PUBLIC_CHANNEL, "Right click on this object (animesh) and select \"Touch\" to see osClearObjectAnimations usage.");
    }

    // Event handler for touch start
    touch_start(integer number)
    {
        // Clear all animations on the prim and get the total number of animations cleared
        integer total = osClearObjectAnimations();

        // Check if any animations were cleared
        if (total > 0)
        {
            // If animations were cleared, notify in chat
            llSay(PUBLIC_CHANNEL, (string)total + " animation(s) of this object (animesh) have been cleared with success ...");
        }
        else
        {
            // If no animations were cleared, notify in chat
            llSay(PUBLIC_CHANNEL, "There is " + (string)total + " animation running in this object ...");
        }
    }
}
/*
//
// osClearObjectAnimations Script Example
// Author= djphil
//

default
{
    state_entry()
    {
        // Display instructions for testing osClearObjectAnimations usage
        llSay(PUBLIC_CHANNEL, "Drop this script to the object's inventory (animesh) to see osClearObjectAnimations usage.");
        llSay(PUBLIC_CHANNEL, "The script will then be automatically deleted from the object's inventory (animesh).");
        
        // Clear all animations on the prim and get the total number of animations cleared
        integer total = osClearObjectAnimations();

        // Check if any animations were cleared
        if (total > 0)
        {
            // If animations were cleared, notify in chat
            llSay(PUBLIC_CHANNEL, (string)total + " animation(s) of this object (animesh) have been cleared with success ...");
        }
        else
        {
            // If no animations were cleared, notify in chat
            llSay(PUBLIC_CHANNEL, "There is " + (string)total + " animation running in this object ...");
        }

        // Remove the script from the object's inventory
        llRemoveInventory(llGetScriptName());
    }
}
*/
