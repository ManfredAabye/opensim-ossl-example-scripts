/*
string osDrawImage(string drawList, integer width, integer height, string imageUrl)
    The provided script demonstrates the usage of the osDrawImage() function, which appends an image drawing command to the string provided in drawList and returns the result.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state.

    Inside state_entry(), a variable CommandList is initialized to store drawing commands.

    The URL of the image to draw is specified in the ImageURL variable.

    Various drawing commands are appended to CommandList to move the pen to a specific position and draw the image with specified width and height.

    Finally, the drawn image is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawImage
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";

        // URL of the image to draw
        string ImageURL = "http://opensimulator.org/skins/osmonobook/images/headerLogo.png";

        // Upper left corner at (0, 0)
        CommandList = osMovePen( CommandList, 0, 0 );

        // Draw the image with specified width and height
        CommandList = osDrawImage( CommandList, 256, 54, ImageURL );

        // Set dynamic texture data to display the drawn image
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
