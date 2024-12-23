/*
string osGetGender(key id)
This function retrieves the gender of the specified avatar.
*/

//
// Example of osGetGender.
//

default
{
    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer total_number)
    {
        // Retrieve the gender of the avatar that touched the object using osGetGender().
        // llDetectedKey(0) returns the key of the avatar that touched the object.
        string gender = osGetGender(llDetectedKey(0));

        // Display the gender of the avatar.
        llSay(0, "Your gender is: " + gender);
    }
}
