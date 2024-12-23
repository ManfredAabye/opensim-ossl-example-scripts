/*
osAgentSaveAppearance(key agentId, string notecard, integer includeHuds)
    The script demonstrates the usage of osAgentSaveAppearance function to save an avatar's appearance to a notecard.
    In the first version of the script, the appearance is saved without considering HUD attachments.
    In the second version of the script, an additional option includeHuds is introduced to specify whether to include HUD attachments in the appearance save process.
    Both versions of the script prompt users to touch the object to trigger the touch_start event, 
    where the osAgentSaveAppearance function is called to save the appearance to a notecard for the touching avatar.
*/

//
// osAgentSaveAppearance Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osAgentSaveAppearance is used
        llSay(PUBLIC_CHANNEL, "Touch to see osAgentSaveAppearance usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar who touched the object
        key toucher = llDetectedKey(0);

        // Check if the avatar's size is not zero vector (i.e., if the avatar is present in the same region)
        if (llGetAgentSize(toucher) != ZERO_VECTOR)
        {
            // Attempt to save the avatar's appearance to a notecard using osAgentSaveAppearance
            key result = osAgentSaveAppearance(toucher, (string)toucher);

            // Check if the result is successful
            if (result && result != NULL_KEY)
            {
                llSay(PUBLIC_CHANNEL, "Notecard \"" + (string)toucher + "\" saved with success.");
            }
            else
            {
                llSay(PUBLIC_CHANNEL, "Notecard \"" + (string)toucher + "\" saved without success.");
            }
        }
        else
        {
            // Send an instant message to the avatar indicating that they need to be in the same region to use the function
            llInstantMessage(toucher, "You need to be in the same region to use this function ...");
        }
    }
}

/* And with "includeHuds"

//
// osAgentSaveAppearance (with option) Script Example
// Author: djphil
//

// Define a variable to specify whether to include HUD attachments in appearance save
integer includeHuds = TRUE;

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osAgentSaveAppearance is used with an option
        llSay(PUBLIC_CHANNEL, "Touch to see osAgentSaveAppearance (with option) usage.");
    }

    touch_start(integer number)
    {
        // Get the key of the avatar who touched the object
        key toucher = llDetectedKey(0);

        // Check if the avatar's size is not zero vector (i.e., if the avatar is present in the same region)
        if (llGetAgentSize(toucher) != ZERO_VECTOR)
        {
            key result;

            // Check the includeHuds variable to determine whether to include HUD attachments in appearance save
            if (includeHuds == TRUE)
            {
                result = osAgentSaveAppearance(toucher, (string)toucher, TRUE);
            }
            else
            {
                result = osAgentSaveAppearance(toucher, (string)toucher, FALSE);
            }

            // Check if the result is successful
            if (result && result != NULL_KEY)
            {
                llSay(PUBLIC_CHANNEL, "Notecard \"" + (string)toucher + "\" saved with success.");
            }
            else
            {
                llSay(PUBLIC_CHANNEL, "Notecard \"" + (string)toucher + "\" saved without success.");
            }
        }
        else
        {
            // Send an instant message to the avatar indicating that they need to be in the same region to use the function
            llInstantMessage(toucher, "You need to be in the same region to use this function ...");
        }
    }
}
*/
