/*
rotation osSlerp(rotation a, rotation b, float ratio);
    rotation rot_a; rotation rot_b;: Declares two rotation variables rot_a and rot_b to store the starting and ending rotations for interpolation.
    state_entry(): Event handler triggered when the script starts running. It sends a message to the public channel to notify users to touch the object.
    touch_start(integer number): Event handler triggered when the object associated with the script is touched.
    Inside touch_start, the script generates a random rotation and stores it in rot_b. It then interpolates between rot_a and rot_b using osSlerp by gradually changing the interpolation ratio (ratio) from 0 to 1 in increments of 0.1. For each step, it sets the rotation of the object using llSetLinkPrimitiveParamsFast.
    The loop runs for 10 steps (counter) to smoothly transition between the two rotations.

In summary, this script demonstrates how to smoothly interpolate between two rotations using osSlerp in an OpenSim environment when the object associated with the script is touched.
*/

// osSlerp Script Example
// Author: djphil

 
rotation rot_a;
rotation rot_b;

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osSlerp usage."); // Notifies users to touch the object
    }

    touch_start(integer number)
    {
        float ratio; // Variable to control the interpolation ratio
        rot_a = rot_b; // Store the current rotation in rot_a
        rot_b = llEuler2Rot(<llFrand(PI), llFrand(PI), llFrand(PI)>); // Generate a random rotation and store it in rot_b
        integer counter = 10; // Counter to limit the number of interpolation steps

        do {
            ratio += 0.1; // Increment the interpolation ratio
            llSetLinkPrimitiveParamsFast(LINK_THIS, [PRIM_ROTATION, osSlerp(rot_a, rot_b, ratio)]); // Interpolate between rot_a and rot_b using osSlerp and set the rotation of the object
            llSleep(0.1); // Sleep for a short duration to allow the rotation to update
        }
        while(--counter); // Repeat the interpolation process for 10 steps
    }
}
