/*
vector osGetDrawStringSize(string contentType, string text, string fontName, integer fontSize)
This function retrieves the size of the drawn string in the specified font and font size.
*/

// Example of osGetDrawStringSize
default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        string CommandList = ""; // Storage for our drawing commands
        string TextToDraw = "Hello, World!"; // text to draw

        // Retrieve the size of the drawn string in the specified font and font size using osGetDrawStringSize().
        vector Extents = osGetDrawStringSize("vector", TextToDraw, "Arial", 14);

        // Calculate the positions to center the text horizontally and vertically.
        integer xpos = 128 - ((integer)Extents.x >> 1); // Center the text horizontally
        integer ypos = 127 - ((integer)Extents.y >> 1); // Center the text vertically

        // Position the text using osMovePen().
        CommandList = osMovePen(CommandList, xpos, ypos);

        // Place the text using osDrawText().
        CommandList = osDrawText(CommandList, TextToDraw);

        // Draw the text by setting dynamic texture data using osSetDynamicTextureData().
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
