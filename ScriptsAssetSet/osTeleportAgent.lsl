/*
osTeleportAgent(key agent, integer regionX, integer regionY, vector position, vector lookat)
osTeleportAgent(key agent, string regionName, vector position, vector lookat)
osTeleportAgent(key agent, vector position, vector lookat)
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code. 
Note: You'll need to define the variables Destination, LandingPoint, and LookAt somewhere in your script or prior to using them.
*/

// Example osTeleportAgent Script
//
// Set Destination as described below, There are a Few Options depending on Application:
// IN GRID Teleport 
// Destination = "1000,1000"; = Using In-Grid Map XXXX,YYYY coordinates
// Destination = "RegionName"; = Using RegionName
// HyperGrid Teleport (region must be HG Enabled)
// Destination = "TcpIpAddr:Port:RegionName"; = Using the Target/Destination IP Address
// Destination = "DNSname:Port:RegionName"; = Using the Target/Detination DNSname
// Note: RegionName is Optionally Specified to deliver Avatar to specific region in an instance.
// 
// ========================================================================================
// === SET DESTINATION INFO HERE ===
//
string Destination = "LBSA Plaza"; // your target destination here (SEE NEXT LINES) Can Be
vector LandingPoint = <128.0, 128.0, 50.0>; // X,Y,Z landing point for avatar to arrive at
vector LookAt = <0.0, 1.0, 0.0>; // which way they look at when arriving
//
// This script implements a teleportal in OpenSim.

default
{
    // This event is triggered when the object is rezzed in-world
    on_rez(integer start_param)
    {
        // Reset the script to its initial state
        llResetScript();
    }

    // This event is triggered when there is a change in the object's properties
    changed(integer change)
    {
        // Check if the owner of the object has changed
        if (change & CHANGED_OWNER)
        {
            // Reset the script if the owner has changed
            llResetScript();
        }
        // Check if the region is undergoing a restart (bit 8 is set during a region restart)
        else if (change & 256)
        {
            // Reset the script during a region restart
            llResetScript();
        }
    }

    // This event is triggered when the script starts running
    state_entry()
    {
        // Send a whisper message to the owner indicating that the teleportal is active
        llWhisper(0, "OS Teleportal Active");
    }

    // This event is triggered when an avatar touches the object
    touch_start(integer num_detected) 
    {
        // Get the key of the avatar who touched the object
        key avatar = llDetectedKey(0);
        
        // Send an instant message to the avatar indicating teleportation destination
        llInstantMessage(avatar, "Teleporting you to: " + Destination);
        
        // Teleport the avatar to the specified destination, landing point, and look-at position
        osTeleportAgent(avatar, Destination, LandingPoint, LookAt); 
    }
}
