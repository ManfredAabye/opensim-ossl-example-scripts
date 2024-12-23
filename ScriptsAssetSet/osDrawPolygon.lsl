/*
string osDrawPolygon(string drawList, list xpoints, list ypoints)
    The provided script demonstrates the usage of the osDrawPolygon() function, which appends a polygon drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, and draw polygons with specified points.

    Finally, the drawn polygons are displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawPolygon
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set the pen size to 3 pixels
        CommandList = osSetPenSize( CommandList, 3 );

        // Set the pen color to blue
        CommandList = osSetPenColor( CommandList, "Blue" );

        // Draw the first polygon
        CommandList = osDrawPolygon( CommandList, [128, 20, 236], [20, 186, 186] );

        // Set the pen color to green
        CommandList = osSetPenColor( CommandList, "Green" );

        // Draw the second polygon
        CommandList = osDrawPolygon( CommandList, [128, 20, 236], [236, 70, 70] );

        // Set the pen size to 5 pixels
        CommandList = osSetPenSize( CommandList, 5 );

        // Set the pen color to red
        CommandList = osSetPenColor( CommandList, "Red" );

        // Draw the third polygon
        CommandList = osDrawPolygon( CommandList, [20, 236, 236, 20], [20, 20, 236, 236] );

        // Now draw the polygons
        osSetDynamicTextureData( "", "vector", CommandList, "", 0 );
    }
}
