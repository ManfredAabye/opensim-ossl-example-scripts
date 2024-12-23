/*
string osDrawFilledRectangle(string drawList, integer width, integer height)
    The provided script demonstrates the usage of the osDrawFilledRectangle() function, which appends a filled rectangle drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, move the pen to a specific position, and draw a filled rectangle with specified width and height.

    Finally, the drawn filled rectangle is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawFilledRectangle
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

        // Upper left corner at (28, 78)
        CommandList = osMovePen( CommandList, 28, 78 );

        // Draw a filled rectangle with width 200 pixels and height 100 pixels
        CommandList = osDrawFilledRectangle( CommandList, 200, 100 );

        // Set dynamic texture data to display the drawn filled rectangle
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
