/*
osTeleportOwner(integer regionX, integer regionY, vector position, vector lookat)

osTeleportOwner(string regionName, vector position, vector lookat)
osTeleportOwner(vector position, vector lookat)
Teleports the owner of the object containing the script to the specified location. 
The first variant is able to teleport to any addressable region, including hypergrid destinations. 
The second variant teleports to a region in the local grid; the region coordinates are specified as region cells (not as global coordinates based on meters). 
The third variant teleports within the current region.
*/

// Teleporting HUD script
// Put this script into a prim and attach it as a HUD
 
// Define a list of destinations with their names
list Destinations = [
    "Welcome Area",
    "hg.osgrid.org:80",
    "ucigrid00.nacs.uci.edu:8002:Gateway 3000",
    "ucigrid00.nacs.uci.edu:8002:Gateway 7000"
];

// Declare a list to store the region names
list RegionNames;

// Default state for the object
default {
    // This event is triggered when the script starts running
    state_entry() {
        // Derive region names from destinations
        integer i;
        for (i = 0; i < llGetListLength(Destinations); ++i) {
            // Get the i-th destination from the list
            string destination = llList2String(Destinations, i);
            
            // Split the destination string by ":" delimiter
            list parts = llParseString2List(destination, [":"], []);
            
            // Count the number of parts in the split destination
            integer numParts = llGetListLength(parts);
            
            // Check if the destination is a hypergrid address with or without region name
            if (numParts > 2)       // Hypergrid address with region name
                RegionNames += [ llList2String(parts, 2) ];
            else if (numParts == 2) // Hypergrid address without region
                RegionNames += [ llList2String(parts, 0) ];
            else                    // Destination in the local grid
                RegionNames += destination;
        }
    }
    
    // This event is triggered when an avatar touches the object
    touch_start(integer number) {
        // Listen for the avatar's choice of destination
        llListen(-1234, "", llGetOwner(), "");
        
        // Display a dialog to the avatar with a list of available destinations
        llDialog(llDetectedKey(0), "Choose a destination:", RegionNames, -1234);
    }
    
    // This event is triggered when a message is received on a specific channel
    listen(integer channel, string name, key id, string message) {
        // Find the index of the chosen destination in the list of region names
        integer index = llListFindList(RegionNames, [ message ]);
        
        // Get the corresponding destination from the list of destinations
        string destination = llList2String(Destinations, index);
        
        // Send a message to the owner indicating teleportation to the chosen destination
        llOwnerSay("Teleporting to " + destination);
        
        // Teleport the owner to the chosen destination
        osTeleportOwner(destination, <128, 128, 20>, ZERO_VECTOR);
    }
}
