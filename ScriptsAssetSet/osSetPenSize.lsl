/*
string osSetPenSize(string drawList, integer penSize)
    state_entry(): This is an event that occurs when the script is started. It initializes the drawing commands and applies them as dynamic texture data.

    string CommandList = "";: This initializes an empty string variable CommandList which will store the drawing commands.

    osSetPenColor(CommandList, "Red");: This sets the pen color to red.

    for (i = 1; i < 13; ++i): This loop iterates from 1 to 12 (inclusive).

    CommandList = osSetPenSize(CommandList, i);: This sets the pen size to the current iteration value i.

    CommandList = osDrawLine(CommandList, 15, i * 20, 241, i * 20);: This draws a horizontal line from the coordinates (15, i * 20) to (241, i * 20) with the current pen size.

    osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);: This applies the drawing commands stored in CommandList as dynamic texture data to the object. The texture is applied in vector format with the specified width and height, and the texture data is set to be updated immediately (timer set to 0).
*/

// Example of osSetPenSize
default
{
    state_entry()
    {
        string CommandList = ""; // Storage for our drawing commands
        integer i;

        // Set the pen color to red
        CommandList = osSetPenColor(CommandList, "Red");

        // Loop to draw horizontal lines with varying pen sizes
        for (i = 1; i < 13; ++i)
        {
            // Set the pen size
            CommandList = osSetPenSize(CommandList, i);

            // Draw a horizontal line from (15, i*20) to (241, i*20)
            CommandList = osDrawLine(CommandList, 15, i * 20, 241, i * 20);
        }

        // Apply the drawing commands as dynamic texture data to the object
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
