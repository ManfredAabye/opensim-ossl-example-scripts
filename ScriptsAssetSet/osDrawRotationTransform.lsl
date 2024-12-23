/*
string osDrawRotationTransform(string drawList, float x)
    The provided script demonstrates the usage of the osDrawRotationTransform() function, which applies rotation transform to subsequent drawing commands.

    It starts with a comment block describing the function's purpose.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. Drawing commands are appended to CommandList inside a loop to demonstrate the effect of rotation transform. 
    Finally, the drawn text is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

//
// osDrawRotationTransform Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osDrawRotationTransform usage.");
    }

    touch_start(integer number)
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set font name to Courier New
        CommandList = osSetFontName(CommandList, "Courier New");

        // Set font size to 20
        CommandList = osSetFontSize(CommandList, 20);

        // Set pen size to 10
        CommandList = osSetPenSize(CommandList, 10);

        // Loop to draw lines and text with rotation transform
        integer i;
        for (i = 0; i < 25; ++i)
        {
            // Draw lines
            CommandList = osDrawLine(CommandList, 20, 10, 250, 10);
            CommandList = osDrawLine(CommandList, 455, 10, 725, 10);

            // Move pen and draw text
            CommandList = osMovePen(CommandList, 250, 0);
            CommandList = osDrawText(CommandList, "Hello World!");

            // Apply rotation transform
            CommandList = osDrawRotationTransform(CommandList, 4.0);
        }

        // Reset all transforms
        CommandList = osDrawResetTransform(CommandList);

        // Display the drawn text
        osSetDynamicTextureData("", "vector", CommandList, "width:512,height:512", 0);
    }
}
