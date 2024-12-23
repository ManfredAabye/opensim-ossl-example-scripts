/*
string osGetAvatarHomeURI(key avatarId)
This function retrieves the Home URI of the specified avatar.
*/

//
// Sample Script
//

default
{
    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer num_detected)
    {
        // Get the key of the avatar that touched the object.
        key avatarKey = llDetectedKey(0);

        // Retrieve the Home URI of the avatar using osGetAvatarHomeURI().
        string homeUri = osGetAvatarHomeURI(avatarKey);

        // Display the Home URI of the avatar.
        llSay(0, "Your Home URI is: " + homeUri);
    }
}
