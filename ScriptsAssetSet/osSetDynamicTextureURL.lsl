/*
string osSetDynamicTextureURL(string dynamicID, string contentType, string url, string extraParams, integer timer)
This script is used to test the osSetDynamicTextureURL function in OpenSim. When an avatar touches the object, it initiates a test process. 
The script requests a dynamic texture using the provided image URL ("http://www.goes.noaa.gov/FULLDISK/GEVS.JPG"). 
If the request is successful, it sets the obtained dynamic texture on all sides of the prim and announces the URLTexture in public chat.
*/

// Example of osSetDynamicTextureURL
 
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in public chat to indicate the start of the script
        llSay(PUBLIC_CHANNEL, "osSetDynamicTextureURL Tester");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer number)
    {
        // Say a message in public chat to indicate the testing process
        llSay(PUBLIC_CHANNEL, "Testing ...");
        
        // Initialize variables
        string dynamicID = "";      // ID for the dynamic texture (not used in this script)
        integer refreshRate = 600;  // Refresh rate for updating the texture (in seconds)
        string contentType = "image";   // Type of content (image in this case)
        string srcURL = "http://www.goes.noaa.gov/FULLDISK/GEVS.JPG"; // Source URL of the image (Earth)
        
        // Request a dynamic texture using osSetDynamicTextureURL function
        string URLTexture = osSetDynamicTextureURL(dynamicID, contentType, srcURL, "", refreshRate);
        
        // Check if the URLTexture is valid (non-empty)
        if (llStringLength(URLTexture) > 0) 
        {
            // Say the URLTexture in public chat
            llSay(PUBLIC_CHANNEL, "URLTexture = " + URLTexture);
            
            // Set the dynamic texture on all sides of the prim
            llSetTexture(URLTexture, ALL_SIDES);
        }
    }
}
