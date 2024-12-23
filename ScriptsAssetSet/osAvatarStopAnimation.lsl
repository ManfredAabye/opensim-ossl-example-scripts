/*
osAvatarStopAnimation(key avatar, string animation)
    This script demonstrates the usage of the osAvatarStopAnimation function, which stops a specified animation if it is playing on the avatar given.
    In the state_entry event, a message is displayed prompting users to touch the object to stop the animation.
    When the object is touched, the script retrieves the name of the animation from the object's inventory using llGetInventoryName.
    If the animation exists, it displays a message indicating the animation that is being stopped and then calls osAvatarStopAnimation to stop the animation on the avatar who touched the object.
    If the animation does not exist, it displays an error message indicating that the animation is missing.
*/

// ----------------------------------------------------------------
// Example / Sample Script to show function use.
//
// Script Title:    osAvatarStopAnimation.lsl
// Script Author:   WhiteStar Magic
// Threat Level:    VeryHigh
// Script Source:   
//
// Notes: See Script Source reference for more detailed information
// This sample is full opensource and available to use as you see fit and desire.
// Threat Levels only apply to OSSL & AA Functions
//================================================================
// Inworld Script Line:    osAvatarStopAnimation(key targetuuid, string anim);
//
// NOTE:  anim can be the Name (if contained in prim) or UUID of the animation
//

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to stop the animation
        llSay(0, "Touch to have Avatar STOP using the contained animation with osAvatarStopAnimation ");
    }

    touch_end(integer num)
    {
        // Get the name of the animation from the prim's inventory
        string anim = llGetInventoryName(INVENTORY_ANIMATION, 0);

        // Check if the animation exists
        if (anim == "") 
        {
            llOwnerSay("ERROR: Animation Missing. Please drop an animation in the prim with this script");
            return;
        }
        else
        {
            // Display a message indicating the animation that is being stopped
            llOwnerSay("Now Playing " + anim + " animation");

            // Stop the specified animation on the avatar who touched the object
            osAvatarStopAnimation(llDetectedKey(0), anim);
        }
    }
}
