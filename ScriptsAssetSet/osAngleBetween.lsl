/*
float osAngleBetween(vector a, vector b);
    The script demonstrates the usage of the osAngleBetween function to calculate the angle between two vectors.
    The state_entry event handler displays a message prompting users to touch the object to trigger the touch_start event.
    In the touch_start event handler, two example vectors (input_a and input_b) are defined.
    The osAngleBetween function is called with these vectors to calculate the angle between them.
    The calculated angle is then converted from radians to degrees using the RAD_TO_DEG constant for display purposes.
    Finally, the script sends a message to the public channel displaying the angle between the two vectors in both degrees and radians.
*/

//
// osAngleBetween Script Example
//

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osAngleBetween is used
        llSay(PUBLIC_CHANNEL, "Touch to see osAngleBetween usage.");
    }

    touch_start(integer number)
    {
        // Define two vectors for demonstration purposes
        vector input_a = <1.0, 2.0, 3.0>;
        vector input_b = <3.0, 2.0, 1.0>;

        // Calculate the angle between the two vectors using osAngleBetween function
        float angle = osAngleBetween(input_a, input_b);

        // Convert the angle from radians to degrees for display purposes
        angle *= RAD_TO_DEG;

        // Display the angle between the two vectors in degrees and radians
        llSay(PUBLIC_CHANNEL, "The angle (0.0 and PI) between " + (string)input_a + " and " + (string)input_b +
            " is " + (string)angle + " in degrees and " + (string)(angle * DEG_TO_RAD) + " in radians.");
    }
}
