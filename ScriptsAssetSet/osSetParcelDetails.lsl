/*
osSetParcelDetails(vector pos, list rules)
    In the state_entry() event, a message is displayed indicating to touch the object to trigger the touch_start event.
    In the touch_start event, the script sets up parameters such as the position of the parcel, name, description, owner, group, and claimed date.
    It then creates a list called rules containing these parameters in the format expected by the osSetParcelDetails function.
    Finally, it calls osSetParcelDetails with the position and rules list to set the parcel details for the specified parcel location.
*/

default
{
    state_entry()
    {
        // Display a message indicating to touch the object to use osSetParcelDetails
        llSay(0, "Touch to use osSetParcelDetails Parcels");
    }
    
    touch_start(integer total_num)
    {
        // Define the position of the parcel (center of the region)
        vector position = <128.0, 128.0, 0.0>;
        
        // Specify the parcel name and description
        string name = "My New Land ";
        string descript = "My New Land Description";
        
        // Get the UUID of the owner of the parcel
        key owner = llGetOwner();
        
        // Specify the group UUID for the parcel (NULL_KEY means no group)
        key group = NULL_KEY;
        
        // Specify the claimed date of the parcel (0 for current timestamp)
        integer claimed = 0;
        
        // Setup the rules list with the specified parcel details
        list rules = [
            PARCEL_DETAILS_NAME, name,
            PARCEL_DETAILS_DESC, descript,
            PARCEL_DETAILS_OWNER, owner,
            PARCEL_DETAILS_GROUP, group,
            PARCEL_DETAILS_CLAIMDATE, claimed
        ];
        
        // Use osSetParcelDetails to set the parcel details for the specified position
        osSetParcelDetails(position, rules);
    }
}
