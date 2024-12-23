/*
integer osReplaceRegionEnvironment(integer transition, string daycycle, float daylenght, float dayoffset, float altitude1, float altitude2, float altitude3)
    The script initializes with the declaration of variables including daycycle_a, daycycle_b, daylength, dayoffset, altitude1, altitude2, altitude3, transition, and switch.

    The check_values() function checks if all parameter values are within acceptable ranges. If any of the values are not within the specified ranges, it returns FALSE; otherwise, it returns TRUE.

    In the state_entry() event handler, it checks if parameter values are valid using check_values(), and if valid, it announces them along with the transition time.

    In the touch_start() event handler, it toggles between daycycle_a and daycycle_b using the switch variable. It then calls osReplaceRegionEnvironment() to replace the region environment with the specified parameters.

    It checks if either daycycle_a or daycycle_b is not specified, and if so, it informs that the current environment is used as a base.

    Finally, it informs about the success or failure of replacing the region environment based on the value of result.

Overall, this script allows switching between different day cycles (daycycle_a and daycycle_b) for a region, while also setting parameters such as day length, day offset, and altitudes, with a specified transition time. It ensures that parameter values are within acceptable ranges before proceeding with the environment replacement.
*/

//
// osReplaceRegionEnvironment Script Example
// Author: djphil
//
 
string daycycle_a = "Daycycle_A";
string daycycle_b = "Daycycle_B";
 
float daylength = 10.0; // Range 4.0 to 168.0
float dayoffset = 5.0;  // UTC Range -11.5 to 11.5
 
// Range 1.0 to 4000.0, If 0.0, current is used
// Please keep them sorted (1 < 2 < 3)
float altitude1 = 1000.0;
float altitude2 = 2000.0;
float altitude3 = 3000.0;
 
integer transition = 3;
integer switch;
 
integer check_values()
{
    // Check if all parameter values are within acceptable ranges
    if (daylength < 4.0 || daylength > 168.0) return FALSE;
    if (dayoffset < -11.5 || dayoffset > 11.5) return FALSE;
    if (altitude1 < 1.0 || altitude1 > 4000.0) return FALSE;
    if (altitude2 < 1.0 || altitude2 > 4000.0) return FALSE;
    if (altitude3 < 1.0 || altitude3 > 4000.0) return FALSE;
    if (altitude1 >= altitude2 || altitude1 >= altitude3 || altitude2 >= altitude3) return FALSE;
    return TRUE;
}
 
default
{
    state_entry()
    {
        // Check if parameter values are valid and announce them
        if (check_values() == TRUE)
        {
            llSay(PUBLIC_CHANNEL, "Touch to see osReplaceRegionEnvironment usage.");
            llSay(PUBLIC_CHANNEL, "daylength: " + (string)daylength);
            llSay(PUBLIC_CHANNEL, "dayoffset: " + (string)dayoffset);
            llSay(PUBLIC_CHANNEL, "altitude1: " + (string)altitude1);
            llSay(PUBLIC_CHANNEL, "altitude2: " + (string)altitude2);
            llSay(PUBLIC_CHANNEL, "altitude3: " + (string)altitude3);
            llSay(PUBLIC_CHANNEL, "Transition: " + (string)transition + " second(s).");
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "Invalid value(s) detected ...");
        }
    }
 
    touch_start(integer number)
    {
        integer result;
 
        // Toggle between daycycle_a and daycycle_b
        if (switch = !switch)
        {
            result = osReplaceRegionEnvironment(transition, daycycle_a, daylength, dayoffset, altitude1, altitude2, altitude3);
            llSay(PUBLIC_CHANNEL, "daycycle_a: " + daycycle_a);
        }
        else
        {
            result = osReplaceRegionEnvironment(transition, daycycle_b, daylength, dayoffset, altitude1, altitude2, altitude3);
            llSay(PUBLIC_CHANNEL, "daycycle_b: " + daycycle_b);
        }
 
        // Check if either daycycle is not specified
        if (daycycle_a == "" || daycycle_a == NULL_KEY || daycycle_b == "" || daycycle_b == NULL_KEY)
        {
            llSay(PUBLIC_CHANNEL, "The current environment is used as a base.");
        }
 
        // Check the result of osReplaceRegionEnvironment
        if (result > 0)
        {
            llSay(PUBLIC_CHANNEL, "The Region Environment was replaced with success.");
        }
        else if (result < 0)
        {
            llSay(PUBLIC_CHANNEL, "The Region Environment was replaced without success.");
        }
    }
}
