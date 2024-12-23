/*
string osDrawEllipse(string drawList, integer width, integer height)
    The provided script demonstrates the usage of the osDrawEllipse() function, which appends an ellipse drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, move the pen to a specific position, and draw an ellipse with a specified width and height.

    Finally, the drawn ellipse is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawEllipse
default
{
    state_entry()
    {
        string CommandList = ""; // Storage for our drawing commands

        // Set pen size to 3 pixels
        CommandList = osSetPenSize( CommandList, 3 );
        // Set pen color to blue
        CommandList = osSetPenColor( CommandList, "Blue" );
        // Move pen to the upper left corner at (28, 78)
        CommandList = osMovePen( CommandList, 28, 78 );
        // Draw an ellipse with width 200 pixels and height 100 pixels
        CommandList = osDrawEllipse( CommandList, 200, 100 );

        // Set dynamic texture data to display the drawn ellipse
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
