/*
string osDrawTranslationTransform(string drawList, float x, float y)
    The provided script demonstrates the usage of the osDrawTranslationTransform() function, which applies a translation transform to subsequent drawing commands.

    It starts with a comment block describing the function's purpose.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. 
    Drawing commands are appended to CommandList inside a loop to demonstrate the effect of translation transform. Finally, the drawn text is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

//
// osDrawTranslationTransform Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osDrawTranslationTransform usage.");
    }

    touch_start(integer number)
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set font name to Courier New
        CommandList = osSetFontName(CommandList, "Courier New");

        // Set font size to 10
        CommandList = osSetFontSize(CommandList, 10);

        // Set pen size to 5
        CommandList = osSetPenSize(CommandList, 5);

        // Loop to draw translated text
        integer i;
        for (i = 0; i < 50; ++i)
        {
            // Draw lines
            CommandList = osDrawLine(CommandList, -300, 10, 0, 10);
            CommandList = osDrawLine(CommandList, 105, 10, 520, 10);

            // Move pen to origin
            CommandList = osMovePen(CommandList, 0, 0);

            // Draw text "Hello World!"
            CommandList = osDrawText(CommandList, "Hello World!");

            // Apply translation transform
            CommandList = osDrawTranslationTransform(CommandList, 0.25 * i, 10);
        }

        // Reset all transforms
        CommandList = osDrawResetTransform(CommandList);

        // Display the drawn text
        osSetDynamicTextureData("", "vector", CommandList, "width:512,height:512", 0);
    }
}
