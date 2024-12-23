/*
osSetRegionWaterHeight(float height)
This script allows the owner of the object to set the water height of the region by sending a message in the format "/waterheight <height>" on the specified channel. 
When such a message is received, the script sets the region's water height and sends a confirmation message to the local chat channel.
*/

// Region Water Height utility
// I know, it's probably horribly inefficient and confusing, but it works.
// Arkaniad Exonar, '10
 
float g_WaterHeight; // Global variable to store the water height
integer g_ListenChan = 0; // Channel on which the object listens for commands
list g_ltmp; // Temporary list for parsing message
 
default
{
    // This function is called when the script starts running
    state_entry()
    {
        // Start listening on the specified channel, listening to messages from the owner
        llListen(g_ListenChan, "", llGetOwner(), "");
        
        // Send a message to the local chat indicating that the object is ready for commands
        llSay(0, "Ready for commands");
    }
    
    // This function is called when a message is received on the listening channel
    listen(integer channel, string name, key id, string message)
    {
        // Parse the received message into a list using space as the delimiter
        g_ltmp = llParseString2List(message, [" "], []); 
        
        // Check if the first element of the parsed list is "/waterheight"
        if (llList2String(g_ltmp, 0) == "/waterheight") 
        {
            // Convert the second element of the parsed list to float and set it as the region's water height
            osSetRegionWaterHeight(llList2Float(g_ltmp, 1));
            
            // Send a message to the local chat indicating the new water height
            llSay(0, "Setting region water height to " + llList2String(g_ltmp, 1) + "m (In case anyone was wondering)");
            
            // Clear the temporary list
            g_ltmp = [];
        }
    }
}
