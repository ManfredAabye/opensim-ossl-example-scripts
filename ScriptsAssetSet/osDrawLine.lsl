/*
string osDrawLine(string drawList, integer startX, integer startY, integer endX, integer endY)
    The provided script demonstrates the usage of the osDrawLine() function, which appends a line drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, and draw lines from specified start to end points.

    Finally, the drawn lines are displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawLine
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set the pen width to 3 pixels
        CommandList = osSetPenSize( CommandList, 3 );

        // Set the pen color to red
        CommandList = osSetPenColor( CommandList, "Red" );

        // Draw the first line (long form) from (10,10) to (128,246)
        CommandList = osDrawLine( CommandList, 10, 10, 128, 246 );

        // Set the pen color to green
        CommandList = osSetPenColor( CommandList, "Green" );

        // Draw the second line (short form) from the pen's current position to (246,10)
        CommandList = osDrawLine( CommandList, 246, 10);

        // Now draw the lines
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
