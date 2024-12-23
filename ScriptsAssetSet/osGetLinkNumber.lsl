/*
integer osGetLinkNumber(string name)
This function returns the link number of the first link found with the given name.

Caution: This function is only supported by ubOde for now.

Threat Level: This function does not do a threat level check.
Permissions: Use of this function is always allowed by default.
Delay: 0 seconds
*/

// Example of osGetLinkNumber

string object_name = "Change Me!";

default
{
    state_entry()
    {
        // Retrieve the link number of the first link found with the given name.
        integer link_number = osGetLinkNumber(object_name);
        
        // Display the name of the object corresponding to the retrieved link number.
        llOwnerSay("Name of the link number " + (string)link_number + ": " + llGetLinkName(link_number));
    }
}
