/*
vector osGetLinkStandTarget(integer linkNumber)
This function returns the current stand target position of the specified link number.
*/

// Example of osGetLinkStandTarget

vector target = <0.0, 0.3, 0.55>;
vector rotate = <0.0, 0.0, 90.0>;
float active_link_range = 5.0;
integer link = 2;
key avatar;

debug(string name)
{
    active_link_range = osGetLinkSitActiveRange(link);
    llOwnerSay("active_link_range for avatar " + name + " is " + (string)active_link_range);
}

default
{
    state_entry()
    {
        // Set up sit target and active range
        llUnSit(llAvatarOnSitTarget());
        llSetClickAction(CLICK_ACTION_SIT);
        llLinkSitTarget(link, target, llEuler2Rot(rotate * DEG_TO_RAD));
        osSetLinkSitActiveRange(link, active_link_range);
    }

    changed(integer change)
    {
        if (change & CHANGED_LINK)
        {
            key user = llAvatarOnSitTarget();

            if (user != NULL_KEY)
            {
                // Update active range when avatar sits
                avatar = user;
                debug(osKey2Name(avatar));
            }
            else if (user == NULL_KEY)
            {
                // Reset active range when avatar stands up
                debug(osKey2Name(avatar));
                avatar = NULL_KEY;
            }
            else
            {
                // Reset script if unexpected event occurs
                llResetScript();
            }
        }
    }
}
