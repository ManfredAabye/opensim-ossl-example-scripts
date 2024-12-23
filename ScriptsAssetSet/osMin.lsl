/*
float osMin(float a, float b)
    In the state_entry() event, the object sends a message to the public channel indicating that the script is running when it enters the default state.
    When the object is touched (touch_start() event), it generates two random floating-point numbers a and b using llFrand(10.0).
    It then determines the smaller value between a and b using the osMin(a, b) function, which returns the minimum value of the two.
    The result is displayed in the public channel using llSay().
*/

// Example osMin

default
{
    state_entry()
    {
        // When the object enters the default state, it sends a message to the public channel
        // indicating that the script is running.
        llSay(PUBLIC_CHANNEL, "Script running");
    }
 
    touch_start(integer number)
    {
        // Generate two random floating-point numbers between 0 and 10
        float a = llFrand(10.0);
        float b = llFrand(10.0);
        
        // Determine the smaller value between a and b using the osMin function
        float smallerValue = osMin(a, b);
        
        // Display the result in the public channel
        llSay(PUBLIC_CHANNEL, "\nThe smaller value between " + (string)a + " and " + (string)b + " is " + (string)smallerValue);
    }
}
