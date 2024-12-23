/*
string osSetDynamicTextureURLBlendFace(string dynamicID, string contentType, string url, string extraParams, integer blend, integer disp, integer timer, integer alpha, integer face)
This script prompts avatars in local chat to touch the object. When an avatar touches the object, 
it initializes variables for setting a dynamic texture from a web-based image URL using osSetDynamicTextureURLBlendFace. 
It applies the texture to the specified face of the prim with blending effects, if successful.
*/

// Example of osSetDynamicTextureURLBlendFace

// ExtraParams Values:
//    width - width of the dynamic texture in pixels (example: width:256) 
//    height - height of the dynamic texture in pixels (example: height:256) 
//    alpha - alpha (transparency) component of the dynamic texture. Values are from 0- full to 255 - solid
//    bgcolour - specifies the background color of the texture (example: bgcolour:Red) 
//    setalpha 
//    integer value - any integer value is treated like specifing alpha component 
 
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in local chat to prompt avatars to touch the object
        llSay(0, "Touch to see osSetDynamicTextureURLBlendFace used to render Web Based Image/Texture on a prim");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer total_num)
    {
        // Initialize variables
        string sDynamicID = "";                          // Not implemented yet
        string sContentType = "image";                   // Type of content (image in this case)
        string sURL = "http://www.goes.noaa.gov/FULLDISK/GMVS.JPG"; // URL for WebImage (Earth Shown)
        string sExtraParams = "width:512,height:512";    // Optional parameters in the following format: [param]:[value],[param]:[value]
        integer iBlend = TRUE;                           // TRUE = the newly generated texture is blended with the appropriate existing ones on the prim
        integer iDisp = 2;                               // 1 = expire deletes the old texture.  2 = temp means that it is not saved to the Database.
        integer iTimer = 0;                              // Timer is not implemented yet, leave at 0
        integer iAlpha = 255;                            // Alpha value (0 = 100% Transparent, 255 = 100% Solid)
        integer iFace = 0;                               // Face of the prim to apply the texture
        
        // Set the prepared texture to the prim using osSetDynamicTextureURLBlendFace
        osSetDynamicTextureURLBlendFace(sDynamicID, sContentType, sURL, sExtraParams, iBlend, iDisp, iTimer, iAlpha, iFace);
    }
}
