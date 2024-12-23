/*
string osDrawScaleTransform(string drawList, float x, float y)
    The provided script demonstrates the usage of the osDrawScaleTransform() function, which applies a scale transform to subsequent drawing commands.

    It starts with a comment block describing the function's purpose.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. 
    Drawing commands are appended to CommandList inside a loop to demonstrate the effect of scale transform. 
    Finally, the drawn text is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

//
// osDrawScaleTransform Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osDrawScaleTransform usage.");
    }

    touch_start(integer number)
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set font name to Courier New
        CommandList = osSetFontName(CommandList, "Courier New");

        // Set font size to 15
        CommandList = osSetFontSize(CommandList, 15);

        // Move pen to initial position
        CommandList = osMovePen(CommandList, 10, 20);

        // Loop to draw scaled text
        integer i;
        for (i = 0; i < 12; ++i)
        {
            // Apply scale transform
            CommandList = osDrawScaleTransform(CommandList, 1.25, 1.25);

            // Draw scaled text
            CommandList = osDrawText(CommandList, "☺☻");
        }

        // Reset all transforms
        CommandList = osDrawResetTransform(CommandList);

        // Move pen to new position and draw text
        CommandList = osMovePen(CommandList, 10, 10);
        CommandList = osDrawText(CommandList, "Hello World!");

        // Display the drawn text
        osSetDynamicTextureData("", "vector", CommandList, "width:512,height:512", 0);
    }
}
