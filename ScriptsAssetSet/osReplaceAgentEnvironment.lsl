/*
integer osReplaceAgentEnvironment(key agentKey, integer transition, string daycycle)
    The script starts with the initialization of variables, including daycycle_a, daycycle_b, transition, and switch.

    In the state_entry() event handler, it announces information about the script and the transition time.

    In the touch_start() event handler, it checks if an avatar is present in the region using llGetAgentSize(). If so, it proceeds with the environment switch.

    It toggles between daycycle_a and daycycle_b using the switch variable. However, there is a mistake in the if condition where switch is assigned instead of compared (if (switch = !switch) should be if (switch == !switch)).

    It then uses osReplaceAgentEnvironment() to switch the environment for the avatar.

    It checks if either daycycle_a or daycycle_b is not specified and informs the avatar accordingly. However, there is a mistake in the condition where it checks if a string is empty or NULL_KEY (should be "" instead of NULL_KEY).

    Finally, it informs the avatar about the success or failure of the environment replacement based on the result of osReplaceAgentEnvironment().

Overall, this script allows avatars to switch between different day cycles within a region with a specified transition time.
*/

// osReplaceAgentEnvironment Script Example
// Author: djphil

 
string daycycle_a = "Daycycle_A";
string daycycle_b = NULL_KEY; // should be initialized as an empty string ""
integer transition = 3; // Transition time in seconds
integer switch;

default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osReplaceAgentEnvironment usage.");
        llSay(PUBLIC_CHANNEL, "Transition: " + (string)transition + " second(s).");
    }
 
    touch_start(integer number)
    {
        key agentKey = llDetectedKey(0);
 
        if (llGetAgentSize(agentKey) != ZERO_VECTOR) // Check if the agent (avatar) is present in the region
        {
            integer result;
 
            // Toggle between daycycle_a and daycycle_b
            if (switch = !switch) // This is incorrect, should use == for comparison
            {
                result = osReplaceAgentEnvironment(agentKey, transition, daycycle_a);
                llRegionSayTo(agentKey, PUBLIC_CHANNEL, "daycycle_a: " + daycycle_a);
            }
            else
            {
                result = osReplaceAgentEnvironment(agentKey, transition, daycycle_b);
                llRegionSayTo(agentKey, PUBLIC_CHANNEL, "daycycle_b: " + daycycle_b);
            }
 
            // Check if either daycycle is not specified
            if (daycycle_a == "" || daycycle_a == NULL_KEY || daycycle_b == "" || daycycle_b == NULL_KEY) // This should be corrected
            {
                llRegionSayTo(agentKey, PUBLIC_CHANNEL, "The normal environment for the parcel or region has been selected.");
            }
 
            // Check the result of osReplaceAgentEnvironment
            if (result > 0)
            {
                llRegionSayTo(agentKey, PUBLIC_CHANNEL, "Agent environment replaced with success!");
            }
            else if (result < 0)
            {
                llRegionSayTo(agentKey, PUBLIC_CHANNEL, "Agent environment replaced without success!");
            }
        }
        else
        {
            llInstantMessage(agentKey, "You need to be in the same region to use this function ...");
        }
    }
}
