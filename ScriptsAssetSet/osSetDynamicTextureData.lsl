/*
key osSetDynamicTextureData(string dynamicID, string contentType, string data, string extraParams, integer timer)
This script initializes a string called CommandList to store drawing commands. 
It then sets the pen size to 3 pixels, sets the pen color to red, moves the pen to the upper-left corner at coordinates <28, 78>, 
and draws a filled rectangle with a width of 200 pixels and a height of 100 pixels. 
Finally, it applies the drawing commands to create a dynamic texture on the object using osSetDynamicTextureData().
*/

// Example of OsSetDynamicTextureData used to render custom drawings on a prim
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Initialize a string to store drawing commands
        string CommandList = "";
        
        // Set the pen size to 3 pixels
        CommandList = osSetPenSize(CommandList, 3);
        
        // Set the pen color to red
        CommandList = osSetPenColor(CommandList, "Red");
        
        // Move the pen to the upper left corner at coordinates <28, 78>
        CommandList = osMovePen(CommandList, 28, 78);
        
        // Draw a filled rectangle with width 200 pixels and height 100 pixels
        CommandList = osDrawFilledRectangle(CommandList, 200, 100);
        
        // Apply the drawing commands to create a dynamic texture
        // osSetDynamicTextureData(texture_name, texture_format, data, size, priority)
        // In this case, texture_name is an empty string to indicate we're updating the current texture
        // texture_format is "vector" to specify that the data is vector graphics commands
        // data is the CommandList containing the drawing commands
        // size is the size of the texture in the format "width:height"
        // priority is the priority of the texture update
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
