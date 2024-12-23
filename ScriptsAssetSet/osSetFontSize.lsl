/*
string osSetFontSize(string drawList, integer fontSize)
    The script initializes a string variable CommandList to store drawing commands.
    It then sets the drawing commands to position and draw three lines of text with different font sizes and positions using the osMovePen, osSetFontSize, and osDrawText functions.
    Finally, it renders the text as a dynamic texture on the prim using the osSetDynamicTextureData function with the specified width and height.
*/

// Example of osDrawText
default
{
    state_entry()
    {
        string CommandList = ""; // Storage for our drawing commands

        // Define the drawing commands to position and draw the first line of text
        CommandList = osMovePen(CommandList, 10, 10);               // Set pen position to (10, 10)
        CommandList = osSetFontSize(CommandList, 10);              // Set font size to 10
        CommandList = osDrawText(CommandList, "Ten points!");      // Draw text "Ten points!"

        // Define the drawing commands to position and draw the second line of text
        CommandList = osMovePen(CommandList, 10, 27);               // Set pen position to (10, 27)
        CommandList = osSetFontSize(CommandList, 15);              // Set font size to 15
        CommandList = osDrawText(CommandList, "Fifteen points!");  // Draw text "Fifteen points!"

        // Define the drawing commands to position and draw the third line of text
        CommandList = osMovePen(CommandList, 10, 50);               // Set pen position to (10, 50)
        CommandList = osSetFontSize(CommandList, 20);              // Set font size to 20
        CommandList = osDrawText(CommandList, "Twenty points!");   // Draw text "Twenty points!"

        // Now draw the image by applying the drawing commands as a dynamic texture on the prim
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
