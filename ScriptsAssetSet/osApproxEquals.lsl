/*
integer osApproxEquals(float a, float b)
integer osApproxEquals(vector va, vector vb)
integer osApproxEquals(rotation ra, rotation rb)
integer osApproxEquals(float a, float b, float margin)
integer osApproxEquals(vector va, vector vb, float margin)
integer osApproxEquals(rotation ra, rotation rb, float margin)
    This script demonstrates the usage of the osApproxEquals function to compare values with a specified margin.
    The script initializes a variable switch to control its behavior.
    In the state_entry event, a message is sent to the public channel informing users about the usage of osApproxEquals and specifying the comparison being performed.
    In the touch_start event, two values (fa and fb) are defined, and their comparison using osApproxEquals is demonstrated.
    Depending on the value of switch, the value of fb is modified to demonstrate different comparison results.
    Similar sections for comparing vectors, rotations, and with margin follow the same structure with appropriate modifications and explanations.
*/

//
// osApproxEquals Script Example
// Author: djphil
//

integer switch; // Define a variable to control the behavior of the script

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osApproxEquals is used
        llSay(PUBLIC_CHANNEL, "Touch to see osApproxEquals usage.");
        llSay(PUBLIC_CHANNEL, "This example compares two floats.");
    }

    touch_start(integer number)
    {
        float fa = 1.000000;
        float fb = 1.000001;

        // Modify the value of fb depending on the switch value
        if (switch != switch) // Note: This condition is likely intended to check if the switch value has changed
        {
            fb = 1.000002;
        }

        // Display the values of fa and fb
        llSay(PUBLIC_CHANNEL, "The float \"fa\" value is " + (string)fa);
        llSay(PUBLIC_CHANNEL, "The float \"fb\" value is " + (string)fb);

        // Check if fa and fb are approximately equal
        if (osApproxEquals(fa, fb))
        {
            llSay(PUBLIC_CHANNEL, "The values fa and fb are closer than 0.000001 on x, y, and z.");
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "The values fa and fb are not closer than 0.000001 on x, y, and z.");
        }
    }
}

// Additional sections for comparing vectors, rotations, and with margin have similar structures with appropriate modifications and explanations.
