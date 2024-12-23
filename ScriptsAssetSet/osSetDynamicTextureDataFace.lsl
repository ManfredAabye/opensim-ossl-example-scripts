/*
key osSetDynamicTextureDataFace(string dynamicID, string contentType, string data, string extraParams, integer timer, integer face);
This script sets up drawing commands to create a dynamic texture on the face of the prim. It sets the font name to "Courier New", the font size to 14 pixels, 
moves the pen to the position (20, 20) on the texture, draws the text "A dynamic texture!", and then sets the dynamic texture data for the face of the prim using osSetDynamicTextureDataFace(). 
The texture will be updated once with the provided drawing commands.
*/

// Example of osSetDynamicTextureDataFace
 
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Initialize a string to store drawing commands
        string CommandList;
        
        // Set the font name to "Courier New"
        CommandList = osSetFontName(CommandList, "Courier New");
        
        // Set the font size to 14 pixels
        CommandList = osSetFontSize(CommandList, 14);
        
        // Move the pen to the position (20, 20) on the texture
        CommandList = osMovePen(CommandList, 20, 20); 
        
        // Draw the text "A dynamic texture!"
        CommandList = osDrawText(CommandList, "A dynamic texture!");
        
        // Set the dynamic texture data for the face of the prim
        // osSetDynamicTextureDataFace(texture_name, texture_format, data, size, loop, face)
        // texture_name: Empty string to update the current texture
        // texture_format: "vector" for vector graphics data
        // data: Drawing commands for the face
        // size: Size of the texture in the format "width:height"
        // loop: 0 to update the texture once
        // face: 0 for the default face
        osSetDynamicTextureDataFace("", "vector", CommandList, "width:512,height:512", 0, 0);
    }
}
