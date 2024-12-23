/*
integer osIsNotValidNumber(float d)
This script demonstrates the usage of the osIsNotValidNumber function to check the validity of floating-point numbers. 
It defines a function check_number to provide descriptive messages based on the result of the validity check. 
When the object is touched, it performs various floating-point calculations and displays the validity of the results using the check_number function.
*/

// osIsNotValidNumber Script Example
// Author: djphil
 
// Function to check the validity of a floating-point number
string check_number(float value)
{
    // Check if the value is a NaN (Not a Number)
    integer isValid = osIsNotValidNumber(value);
 
    // Check the result of the validity check and return a descriptive message
    if (isValid == 1)
    {
        return (string)value + " is a NaN (" + (string)isValid + ")";
    }
    else if (isValid == 2)
    {
        return (string)value + " is a Negative Infinity (" + (string)isValid + ")";
    }
    else if (isValid == 3)
    {
        return (string)value + " is a Positive Infinity (" + (string)isValid + ")";
    }
    else
    {
        return (string)value + " is a valid float (" + (string)isValid + ")";
    }
}
 
// Default event handler
default
{
    state_entry()
    {
        // Display a message to prompt users to touch the object to see osIsNotValidNumber usage
        llSay(PUBLIC_CHANNEL, "Touch to see osIsNotValidNumber usage.");
    }
 
    // Touch event handler
    touch_start(integer number)
    {
        // Check and display the validity of different floating-point calculations
        llSay(PUBLIC_CHANNEL, "llSqrt(10.0) : " + check_number(llSqrt(10.0)));
        llSay(PUBLIC_CHANNEL, "llSqrt(-10.0) : " + check_number(llSqrt(-10.0)));
        llSay(PUBLIC_CHANNEL, "-llPow(10.0, 1000.0) : " + check_number(-llPow(10.0, 1000.0)));
        llSay(PUBLIC_CHANNEL, "llPow(10.0, 1000.0) " + check_number(llPow(10.0, 1000.0)));
    }
}
