/*
string osDrawFilledEllipse(string drawList, integer width, integer height)
    The provided script demonstrates the usage of the osDrawFilledEllipse() function, which appends a filled ellipse drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, move the pen to a specific position, and draw a filled ellipse with a specified width and height.

    Finally, the drawn filled ellipse is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawFilledEllipse

default
{
    state_entry()
    {
        string CommandList = "";                                    // Storage for our drawing commands
        CommandList = osSetPenSize( CommandList, 3 );               // Set the pen width to 3 pixels
        CommandList = osSetPenColor( CommandList, "Blue" );         // Set the pen color to blue
        CommandList = osMovePen( CommandList, 28, 78 );             // Upper left corner at <28,78>
        CommandList = osDrawFilledEllipse( CommandList, 200, 100 ); // 200 pixels by 100 pixels

        // Set dynamic texture data to display the drawn filled ellipse
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
