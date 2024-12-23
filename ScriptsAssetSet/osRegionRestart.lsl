/*
integer osRegionRestart(float seconds)
integer osRegionRestart(float seconds, string message)
    The script initializes with setting a text message using llSetText() function in the state_entry() event handler. This sets the text "Region Restart" with the text "osRegionRestart" below it in white color.

    When an avatar touches the object containing this script, the touch() event handler is triggered. It checks if the toucher is the owner of the object using the llDetectedOwner() function and compares it with the toucher's key.

    If the toucher is the owner, it triggers a region restart after a delay of 120 seconds (time) using the osRegionRestart() function. It then announces the restart request along with the delay in the chat using llSay().

    If the toucher is not the owner, it simply announces "You are not the owner" in the chat.

This script provides a simple interface for triggering region restarts in an OpenSimulator environment with some basic access control to prevent unauthorized restarts.
*/

// osRegionRestart Script Example


// Define a global variable to store the owner's key
key owner;

// Define a constant for the delay of restart in seconds
integer time = 120;

// Define the default state
default
{
    // State entry event handler
    state_entry()
    {
        // Set a text message to display when the script is initialized
        llSetText("Region Restart\nosRegionRestart", <1.0,1.0,1.0>,1.0);
    }
    
    // Touch event handler
    touch(integer total_number)
    {
        // Get the key of the owner of the object touched
        owner = llDetectedOwner(0);
        
        // Get the key of the avatar who touched the object
        key toucher = llDetectedKey(0);
        
        // Check if the toucher is the owner
        if (toucher == owner)
        {
            // Trigger a region restart with the specified delay
            osRegionRestart(time);
            
            // Get the name of the toucher
            string name = llKey2Name(toucher);
            
            // Display a message indicating the region restart request and the delay
            llSay(0, "Region Restart requested by " + name + ". The sim will restart in " + ((string)time) + " seconds");
        }
        else
        {
            // If the toucher is not the owner, display a message indicating so
            llSay(0, "You are not the owner");
        }
    }
}
