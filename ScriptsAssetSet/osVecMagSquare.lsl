/*
float osVecMagSquare(vector a)
returns the square of the magnitude of vector a.

This saves a square root math operation that is relative slow, when is not needed.
for example to check if magnitude is larger than 10, check if the square is larger than 100
Threat Level 	ignore is unknown threat level
Permissions 	Use of this function is always allowed by default
Extra Delay 	0 seconds
Example(s)
*/

//
// osVecMagSquare Script Example
// Author: djphil
//
 
// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch to see osVecMagSquare usage.");
    }
 
    // This event is triggered when an avatar touches the object
    touch_start(integer number) 
    {
        // Define a vector representing a point in 3D space
        vector input = <1.0, 2.0, 3.0>;
        
        // Calculate the square of the magnitude of the vector using osVecMagSquare function
        float mag_square = osVecMagSquare(input);
        
        // Send a message to the public chat channel with the result
        llSay(PUBLIC_CHANNEL, "The square of the magnitude of " + (string)input + " is " 
            + (string)mag_square + ".");
    }
}
