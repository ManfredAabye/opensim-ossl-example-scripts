/*
void osKickAvatar(string FirstName,string SurName, string alert)
This script, when placed inside an object in an OpenSim region, will execute state_entry() when the object is initialized. 
Inside this function, it uses the osKickAvatar() function to kick the avatar with the first name "AvatarFirst" 
and the last name "AvatarLast", providing a custom kick message of "You have been kicked!".
*/

//
// osKickAvatar Script Example
//
 
default
{
    state_entry()
    {
        // Kick the avatar with the specified first name ("AvatarFirst"),
        // last name ("AvatarLast"), and provide a kick message.
        osKickAvatar("AvatarFirst", "AvatarLast", "You have been kicked!");
    }
}
