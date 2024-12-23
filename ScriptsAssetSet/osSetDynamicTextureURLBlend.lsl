/*
string osSetDynamicTextureURLBlend(string dynamicID, string contentType, string url, string extraParams, integer timer, integer alpha)
This script prompts avatars in local chat to touch the object. When an avatar touches the object, 
it initializes variables for setting a dynamic texture from a web-based image URL using osSetDynamicTextureURLBlend. 
It sets the texture on all sides of the prim with blending effects, if successful.
*/

// Example of osSetDynamicTextureURLBlend


default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in local chat to prompt avatars to touch the object
        llSay(0, "Touch to see osSetDynamicTextureURLBlend used to render Web Based Image/Texture on a prim");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer total_num)
    {
        // Initialize variables
        string sDynamicID = "";                          // Not implemented yet
        string sContentType = "image";                   // Type of content (image in this case)
        string sURL = "http://www.goes.noaa.gov/FULLDISK/GEVS.JPG"; // URL for WebImage (Earth Shown)
        string sExtraParams = "width:256,height:256";    // Optional parameters in the following format: [param]:[value],[param]:[value]
        integer iTimer = 0;                              // Timer is not implemented yet, leave at 0
        integer iAlpha = 255;                            // Alpha value (0 = 100% Transparent, 255 = 100% Solid)
        
        // Set the prepared texture info to a string using osSetDynamicTextureURLBlend
        string sTexture = osSetDynamicTextureURLBlend(sDynamicID, sContentType, sURL, sExtraParams, iTimer, iAlpha);
        
        // Check if the returned texture string is valid (non-empty)
        if (llStringLength(sTexture) > 0) 
        {
            // Say the URL of the texture in local chat
            llSay(0, "URL of Texture = " + sURL);
            
            // Set the texture on all sides of the prim
            llSetTexture(sTexture, ALL_SIDES);
        }
    }
}
