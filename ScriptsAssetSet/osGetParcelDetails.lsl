/* osGetParcelDetails(key parcelID, list rules)
When an avatar touches the object, this script retrieves the parcel IDs in the region, 
then iterates through each parcel to retrieve details such as the owner, name, and area of each parcel. 
It then outputs these details to the chat. Note that this script requires appropriate permissions to access parcel details.  
*/

default
{
    touch_start(integer total_number)
    {
        // Get a list of parcel IDs in the region
        list ids = osGetParcelIDs();
        
        // Get the total number of parcels
        integer count = llGetListLength(ids);
        
        // Initialize a counter
        integer i = 0;
        
        // Iterate through each parcel ID
        while (i < count)
        {
            // Get details of the parcel using its ID
            list details = osGetParcelDetails(llList2Key(ids, i),
                                               [PARCEL_DETAILS_OWNER,
                                                PARCEL_DETAILS_NAME,
                                                PARCEL_DETAILS_AREA]);
            
            // Format and output the details to chat
            llSay(0, "** " + llDumpList2String(details, " "));
            
            // Move to the next parcel ID
            i++;
        }
    }
}

