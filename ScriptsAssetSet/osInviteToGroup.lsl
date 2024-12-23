/*
integer osInviteToGroup(key user)
This script allows the owner of the object to invite a user to the object's group by touching the object. 
It checks if the provided userID is valid and replaces a placeholder if needed. 
If the toucher is not the owner, they are informed that they cannot invite users to the group. 
If the owner successfully invites the user, they receive a confirmation message.
*/

// osInviteToGroup Script Exemple
// Author: djphil
 
// Define the UUID of the user to invite to the group
key userID = "<USER_UUID_TO_INVITE>";

// Default event handler
default
{
    state_entry()
    {
        // Check if the userID is set to the placeholder or not a valid UUID
        if (userID == "<USER_UUID_TO_INVITE>" || !osIsUUID(userID))
        {
            // Inform the owner to replace the placeholder with a valid UUID
            llOwnerSay("Please replace <USER_UUID_TO_EJECT> with a valid user UUID.");
        }
        else
        {
            // Inform users to touch the object to see the invitation to the group
            llSay(PUBLIC_CHANNEL, "Touch to see osInviteToGroup invite you to this object's group.");
        }
    }

    // Touch event handler
    touch_start(integer number)
    {
        // Check if the toucher is the owner of the object
        if (llDetectedKey(0) == llGetOwnerKey(llGetKey()))
        {
            // Invite the user to the group and store the result
            integer result = osInviteToGroup(userID);

            // Check the result of the invitation
            if (result == 0) // FALSE
            {
                // Inform the owner that the invitation was sent unsuccessfully
                llOwnerSay("Invitation sent unsuccessfully.");
            }
            if (result == 1) // TRUE
            {
                // Inform the owner that the invitation was sent successfully
                llOwnerSay("Invitation sent successfully.");
            }
            if (result == 2)
            {
                // Inform the owner that the user is already a member of the group
                llOwnerSay("This user is already a member of this object's group.");
            }
        }
        else
        {
            // Inform non-owners that they cannot invite users to the group
            llSay(PUBLIC_CHANNEL, "Sorry, you are not the owner of this object.");
        }
    }
}
