/*
string osDrawFilledPolygon(string drawList, list xpoints, list ypoints)
    The provided script demonstrates the usage of the osDrawFilledPolygon() function, which appends a filled polygon drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    Various drawing commands are appended to CommandList to set the pen size, pen color, and draw a filled polygon with specified points.

    Finally, the drawn filled polygon is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawFilledPolygon
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set the pen width to 3 pixels
        CommandList = osSetPenSize( CommandList, 3 );

        // Set the pen color to blue
        CommandList = osSetPenColor( CommandList, "Blue" );

        // Define the points of the polygon
        list xpoints = [50, 100, 50];
        list ypoints = ["50", 100, 150.0]; // You can use either integer, float, or string

        // Append a filled polygon drawing command to the CommandList
        CommandList = osDrawFilledPolygon( CommandList, xpoints, ypoints );

        // Set dynamic texture data to display the drawn filled polygon
        osSetDynamicTextureData( "", "vector", CommandList, "", 0 );
    }
}
