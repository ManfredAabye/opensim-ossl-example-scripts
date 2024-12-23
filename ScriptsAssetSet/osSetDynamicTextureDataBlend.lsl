/*
key osSetDynamicTextureDataBlend(string dynamicID, string contentType, string data, string extraParams, integer timer, integer alpha)
This script prompts avatars in local chat to touch the object. When an avatar touches the object, it initializes variables for dynamic texture creation. 
It then sets up drawing commands to draw a filled rectangle and place text inside it. Finally, 
it uses osSetDynamicTextureDataBlend() to render the custom drawing on the prim with blending effects. 
Note that the dynamic texture's ID, timer functionality, and alpha values are placeholders or not implemented in this example.
*/

// Example of osSetDynamicTextureDataBlend


// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in local chat to prompt avatars to touch the object
        llSay(0, "Touch to see osSetDynamicTextureDataBlend used to render custom drawings on a prim");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer total_num)
    {
        // Initialize variables
        string sDynamicID = "";                          // Not implemented yet
        string sContentType = "vector";                  // 'vector' for text/lines, etc. 'image' for texture only
        string sData = "";                               // Storage for our drawing commands
        string sExtraParams = "width:256,height:256";    // Optional parameters in the following format: [param]:[value],[param]:[value]
        integer iTimer = 0;                              // Timer is not implemented yet, leave at 0
        integer iAlpha = 100;                            // 0 = 100% Alpha, 255 = 100% Solid
        
        // Drawing commands used in the example
        // Draw a filled rectangle
        sData = osSetPenSize(sData, 3);                   // Set the pen width to 3 pixels
        sData = osSetPenColor(sData, "Red");             // Set the pen color to red
        sData = osMovePen(sData, 28, 78);                 // Upper left corner at <28,78>
        sData = osDrawFilledRectangle(sData, 200, 100);   // 200 pixels by 100 pixels
        
        // Setup text to go in the drawn box
        sData = osMovePen(sData, 30, 80);                 // Place pen @ X,Y coordinates 
        sData = osSetFontName(sData, "Arial");            // Set the font name to use
        sData = osSetFontSize(sData, 10);                 // Set the font size in pixels
        sData = osSetPenColor(sData, "Green");           // Set the pen color to green
        sData = osDrawText(sData, "Your Name is: " + llDetectedName(0)); // The text to write
        
        // Draw it out
        osSetDynamicTextureDataBlend(sDynamicID, sContentType, sData, sExtraParams, iTimer, iAlpha);
    }
}
