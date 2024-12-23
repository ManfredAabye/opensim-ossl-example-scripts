/*
string osMovePen(string drawList, integer x, integer y)
    In the state_entry() event, the script initializes a string variable CommandList to store drawing commands.
    It sets the pen width to 3 pixels using osSetPenSize() function.
    The pen color is set to blue using osSetPenColor() function.
    A loop is used to draw lines:
        The pen is moved to the right side using osMovePen() function.
        A line is drawn to the left and slightly down using osDrawLine() function.
    Finally, the drawing commands stored in CommandList are applied to a dynamic texture using osSetDynamicTextureData() function to render the drawing on an object's surface.

This script effectively draws a pattern of blue lines on a dynamic texture with dimensions 256x256 pixels.
*/

// Example of osMovePen
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
        
        // Loop to draw lines
        integer i;
        for (i = 0; i < 256; i += 20)
        {
            // Move the pen to the right side
            CommandList = osMovePen( CommandList, 255, i );
            
            // Draw a line to the left and slightly down
            CommandList = osDrawLine( CommandList, 0, i+20 );
        }
 
        // Draw the lines on a dynamic texture
        osSetDynamicTextureData( "", "vector", CommandList, "width:256,height:256", 0 );
    }
}
