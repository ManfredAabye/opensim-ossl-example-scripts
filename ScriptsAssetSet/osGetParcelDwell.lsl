/*
integer osGetParcelDwell(vector pos)
These scripts allow avatars to touch an object, which then retrieves the dwell time of avatars on the parcel where the object is located. 
The first script uses osGetParcelDwell, while the second script uses PARCEL_DETAILS_DWELL to achieve the same result. 
Both scripts output the dwell time to the public channel in the chat.
*/

// osGetParcelDwell Script Exemple
// Author: djphil
 
default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osGetParcelDwell usage.");
    }
 
    touch_start(integer number)
    {
        // Get the position of the object
        vector position = llGetPos();
        
        // Get the parcel details including dwell time
        list details = llGetParcelDetails(position, [PARCEL_DETAILS_NAME]);
        
        // Get the dwell time of avatars on the parcel
        float dwellTime = osGetParcelDwell(position);
        
        // Output the dwell time to chat
        llSay(PUBLIC_CHANNEL, "Total dwell on parcel " + llList2String(details, 0) + " is " + (string)dwellTime);
    }
}

/* And with PARCEL_DETAILS_DWELL

//
// PARCEL_DETAILS_DWELL Script Exemple
// Author: djphil
//
 
default
{
    state_entry()
    {
        llSay(PUBLIC_CHANNEL, "Touch to see PARCEL_DETAILS_DWELL usage.");
    }
 
    touch_start(integer number)
    {
        // Get the parcel details including dwell time
        list details = llGetParcelDetails(llGetPos(), [PARCEL_DETAILS_NAME, PARCEL_DETAILS_DWELL]);
        
        // Output the parcel name and dwell time to chat
        llSay(PUBLIC_CHANNEL, "Total dwell on parcel " + llList2String(details, 0) + " is " + llList2String(details, 1));
    }
}
*/
