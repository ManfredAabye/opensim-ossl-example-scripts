/*
This script calculates the angle between two rotations and then notifies the owner about the result. 
In this case, it calculates the angle between the ZERO_ROTATION (which represents no rotation) 
and the rotation of the object obtained using llGetRot(). 
The result is then converted to a string and outputted to the owner using llOwnerSay(). 
The comment at the end indicates the expected result when llGetRot() returns <0, 0, 90>.
*/

// Define the default state
default
{
    // Event handler for state entry
    state_entry()
    {
        // Define a rotation variable initialized with the ZERO_ROTATION constant
        rotation aRot = ZERO_ROTATION;

        // Get the rotation of the object
        rotation bRot = llGetRot();

        // Calculate the angle between the two rotations
        float aBetween = llAngleBetween(aRot, bRot);

        // Convert the angle to a string and notify the owner
        llOwnerSay((string)aBetween);

        // Note: llGetRot() being <0, 0, 90>, this should report 1.570796
    }
}

