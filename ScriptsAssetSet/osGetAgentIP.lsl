/*
string osGetAgentIP(key uuid);
This function retrieves the IP address of the specified avatar.
*/

//
// Example of osGetAgentIP
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // This is a demo script, no action needed in the state_entry.
        // Can be used for any initialization if necessary.
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer total_number)
    {
        // Retrieve the key of the avatar that touched the object.
        key touched_avatar_key = llDetectedKey(0);

        // Retrieve the IP address of the touched avatar using osGetAgentIP().
        string avatar_ip = osGetAgentIP(touched_avatar_key);

        // Display the IP address of the avatar.
        llSay(0, "Your IP is: " + avatar_ip);
    }
}
