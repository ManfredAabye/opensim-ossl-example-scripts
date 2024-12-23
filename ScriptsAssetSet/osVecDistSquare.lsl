/*
float osVecDistSquare(vector a, vector b)
returns the square of norm of vector, or distance vector, (a - b), when expensive square root math operation is not needed.
for example to check if distance is larger than 10, check if the square is larger than 100
*/

//
// osVecDistSquare Script Example
// Author: djphil
//
 
// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a message to the public chat channel indicating how to interact with the object
        llSay(PUBLIC_CHANNEL, "Touch to see osVecDistSquare usage.");
    }
 
    // This event is triggered when an avatar touches the object
    touch_start(integer number) 
    {
        // Define two vectors representing points in 3D space
        vector input_a = <1.0, 2.0, 3.0>;
        vector input_b = <3.0, 2.0, 1.0>;
        
        // Calculate the square of the distance between the two points using osVecDistSquare function
        float distance_square = osVecDistSquare(input_a, input_b);
        
        // Send a message to the public chat channel with the result
        llSay(PUBLIC_CHANNEL, "The square of the distance between " + (string)input_a + " and " + (string)input_b 
            + " is " + (string)distance_square + ".");
    }
}
