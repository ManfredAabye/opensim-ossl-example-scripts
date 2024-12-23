/*
integer osEjectFromGroup(key user)
    The provided script demonstrates the usage of the osEjectFromGroup(key user) function, which attempts to eject a user from the group associated with the object.

    It starts with a comment block describing the function's purpose and the script's author.

    It declares a variable userID to store the UUID of the user to eject. This UUID needs to be replaced with the actual UUID of the user to eject.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It checks if the userID is set to a valid UUID and prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. It checks if the toucher is the owner of the object. If so, it attempts to eject the user specified by userID from the group associated with the object using osEjectFromGroup(userID).

    Depending on the result of the ejection (TRUE for success, FALSE for failure), appropriate messages are sent to the owner of the object using llOwnerSay().

    If the toucher is not the owner of the object, a message is sent indicating that they are not authorized to perform the action.
*/

//
// osEjectFromGroup Script Example
// Author: djphil
//

key userID = "<USER_UUID_TO_EJECT>"; // Replace with the UUID of the user to eject

default
{
    state_entry()
    {
        // Check if the userID is set to a valid UUID
        if (userID == "<USER_UUID_TO_EJECT>" || !osIsUUID(userID))
        {
            llOwnerSay("Please replace <USER_UUID_TO_EJECT> with a valid user UUID");
        }
        else
        {
            // Prompt users to touch for demonstration
            llSay(PUBLIC_CHANNEL, "Touch to see osEjectFromGroup eject the user from this object's group.");
        }
    }

    touch_start(integer number)
    {
        // Check if the toucher is the owner of the object
        if (llDetectedKey(0) == llGetOwnerKey(llGetKey()))
        {
            // Attempt to eject the user from the group
            integer result = osEjectFromGroup(userID);

            // Check the result of the ejection
            if (result == TRUE)
            {
                llOwnerSay("Ejected " + osKey2Name(userID) + " from the group successfully.");
            }
            else if (result == FALSE)
            {
                llOwnerSay("Failed to eject " + osKey2Name(userID) + " from the group.");
            }
        }
        else
        {
            llSay(PUBLIC_CHANNEL, "Sorry, you are not the owner of this object.");
        }
    }
}
