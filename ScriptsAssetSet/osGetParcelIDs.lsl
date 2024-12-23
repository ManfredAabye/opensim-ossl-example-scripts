/* osGetParcelIDs()
When an avatar touches the object, this script retrieves the list of parcel IDs in the region using osGetParcelIDs, 
then iterates through each parcel ID to retrieve details such as the owner, name, and area of each parcel using osGetParcelDetails. 
Finally, it formats and outputs these details to the chat.
*/

default
{
    touch_start(integer total_number)
    {
        // Get a list of parcel IDs in the region
        list parcelIDs = osGetParcelIDs();
        
        // Get the total number of parcels in the region
        integer numParcels = llGetListLength(parcelIDs);
        
        // Iterate through each parcel ID
        integer i = 0;
        while (i < numParcels)
        {
            // Get details of the parcel using its ID
            list parcelDetails = osGetParcelDetails(llList2Key(parcelIDs, i),
                                                     [PARCEL_DETAILS_OWNER,
                                                      PARCEL_DETAILS_NAME,
                                                      PARCEL_DETAILS_AREA]);
            
            // Format and output the parcel details to chat
            llSay(0, "** " + llDumpList2String(parcelDetails, " "));
            
            // Move to the next parcel ID
            i++;
        }
    }
}

