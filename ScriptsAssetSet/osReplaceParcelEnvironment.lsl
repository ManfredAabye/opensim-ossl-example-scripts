/*
integer osReplaceParcelEnvironment(integer transition, string daycycle)
    The script initializes with the declaration of variables including daycycle_a, daycycle_b, transition, and switch.

    In the state_entry() event handler, it announces information about the script and the transition time.

    In the touch_start() event handler, it starts by initializing the result variable.

    It then checks the state of the switch variable, but there is a typo in the if condition (if (switch =! switch) should be if (switch != switch)). This line is supposed to toggle the switch between two states, but due to the typo, it won't function correctly.

    Based on the state of switch, it calls osReplaceParcelEnvironment() function to replace the parcel environment with either daycycle_a or daycycle_b.

    It checks if either daycycle_a or daycycle_b is not specified or empty, and informs about the deletion of the parcel environment.

    Finally, it informs about the success or failure of replacing the parcel environment based on the value of result.

Overall, this script allows switching between different day cycles (daycycle_a and daycycle_b) for a parcel within a region with a specified transition time. However, the functionality related to toggling between day cycles is affected by the typo in the if condition.
*/

// osReplaceParcelEnvironment Script Example
// Author: djphil
 
string daycycle_a = "Daycycle_A";
string daycycle_b = "Daycycle_B";
integer transition = 3;
integer switch;

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osReplaceParcelEnvironment usage.");
        llSay(PUBLIC_CHANNEL, "Transition: " + (string)transition + " second(s).");
    }
 
    touch_start(integer number)
    {
        integer result;
 
        if (switch =! switch) // This line has a typo, should be if (switch != switch)
        {
            result = osReplaceParcelEnvironment(transition, daycycle_a);
            llSay(PUBLIC_CHANNEL, "daycycle_a: " + daycycle_a);
        }
        else
        {
            result = osReplaceParcelEnvironment(transition, daycycle_b);
            llSay(PUBLIC_CHANNEL, "daycycle_b: " + daycycle_b);
        }
 
        if (daycycle_a == "" || daycycle_a == NULL_KEY || daycycle_b == "" || daycycle_b == NULL_KEY)
        {
            llSay(PUBLIC_CHANNEL, "The environment of the parcel has been deleted");
        }
 
        if (result > 0)
        {
            llSay(PUBLIC_CHANNEL, "The Parcel Environment was replaced with success.");
        }
        else if (result < 0)
        {
            llSay(PUBLIC_CHANNEL, "The Parcel Environment was replaced without success.");
        }
    }
}
