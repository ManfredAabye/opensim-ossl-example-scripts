/*
string osSetPenCap(string drawList, string direction, string type)
    state_entry(): This is an event that occurs when the script is started. It initializes the drawing commands and applies them as dynamic texture data.

    string CommandList = "";: This initializes an empty string variable CommandList which will store the drawing commands.

    osSetPenSize(CommandList, 5);: This sets the pen width to 5 pixels to make the arrow visible.

    osSetPenCap(CommandList, "start", "arrow");: This sets the beginning of the line with an arrow.

    osMovePen(CommandList, 50, 100);: This moves the pen to the coordinates (50, 100).

    osLineTo(CommandList, 100, 150);: This draws a line from the current pen position (50, 100) to the coordinates (100, 150).

    osSetDynamicTextureData("", "vector", CommandList, "", 0);: This applies the drawing commands stored in CommandList as dynamic texture data to the object. The texture is applied in vector format with no additional parameters, and the texture data is set to be updated immediately (timer set to 0).
*/

// Example of osSetPenCap
 
default
{
    state_entry()
    {
        string CommandList = "";                              // Storage for our drawing commands
        integer i;

        // Set the pen width to 5 pixels. With 1 pixel, the arrow is very hard to see
        CommandList = osSetPenSize(CommandList, 5);

        // Sets the beginning of the line with an arrow
        CommandList = osSetPenCap(CommandList, "start", "arrow");

        // Moves pen to 50,100
        CommandList = osMovePen(CommandList, 50, 100);

        // Draws a line from 50,100 to 100,150
        CommandList = osLineTo(CommandList, 100, 150);

        // Apply the drawing commands as dynamic texture data to the object
        osSetDynamicTextureData("", "vector", CommandList, "", 0);
    }
}
