/*
string osGetAgentCountry(key avatarID)
This function retrieves the country code of the specified avatar.
*/

//
// Sample script using osGetAgentCountry
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Notify that the script is running.
        llSay(0, "Script running");
    }

    // The touch_end event is triggered when a touch ends on the object.
    touch_end(integer num)
    {
        // Get the key of the avatar that touched the object.
        key avatar_id = llDetectedKey(0);

        // Retrieve the country code of the avatar using osGetAgentCountry().
        string country = osGetAgentCountry(avatar_id);

        // Display the avatar's key and country code.
        llSay(0, "Avatar with id " + (string)avatar_id + " is in country " + country);
    }
}
