/* osGetParcelID()
When an avatar touches the object, this script retrieves the ID of the parcel where the object is located using osGetParcelID, 
then retrieves details of that parcel such as the owner, name, and area using osGetParcelDetails. Finally, it formats and outputs these details to the chat.
*/

default
{
    touch_start(integer total_number)
    {
        // Get the ID of the parcel where the object is located
        key parcelID = osGetParcelID();
        
        // Get details of the parcel using its ID
        list parcelDetails = osGetParcelDetails(parcelID, [PARCEL_DETAILS_OWNER, PARCEL_DETAILS_NAME, PARCEL_DETAILS_AREA]);
        
        // Format and output the parcel details to chat
        llSay(0, "** " + llDumpList2String(parcelDetails, " "));
    }
}

