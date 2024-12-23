/*
string osFormatString(string format, list params)
This function formats a string with parameters provided in a list.
*/

//
// osFormatString() example, by Tom Earth.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Define the string to be formatted with placeholders and a list of parameters.
        string to_format = "My name is {0}. My owner is {1}. I am in the sim {2}";
        list format = [llGetObjectName(), llKey2Name(llGetOwner()), llGetRegionName()];

        // Format the string using osFormatString() and the list of parameters.
        string formatted_string = osFormatString(to_format, format);

        // Display the formatted string using llOwnerSay().
        llOwnerSay(formatted_string);
    }
}
