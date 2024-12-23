/*
list osGetAvatarList()
This function retrieves a list of keys representing all avatars in the current region.
*/

//
// Example of osGetAvatarList.
//

default
{
    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer total_number)
    {
        // Retrieve a list of keys representing all avatars in the current region using osGetAvatarList().
        list avatars = osGetAvatarList();

        // Check if the avatar list is empty, meaning the owner is the only one present in the region.
        if (avatars == [])
        {
            llSay(0, "You must be the owner. There is nobody else here who could have touched me.");
        }
        else
        {
            // If there are other avatars present in the region, display their keys as a comma-separated value string.
            llSay(0, "Avatars in this sim (without the owner): " + llList2CSV(avatars));
        }
    }
}
