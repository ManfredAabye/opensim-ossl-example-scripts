/*
string osDrawResetTransform(string drawList)
    The provided script demonstrates the usage of the osDrawResetTransform() function, which resets all transforms applied to subsequent drawing commands.

    It starts with a comment block describing the function's purpose, threat level, permissions, delay, and examples.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It prompts users to touch for demonstration.

    When touched, the touch_start() event handler is triggered. Drawing commands are appended to CommandList to demonstrate the effect of resetting transforms. Finally, the drawn text is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

//
// osDrawResetTransform Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Prompt to touch for demonstration
        llSay(PUBLIC_CHANNEL, "Touch to see osDrawResetTransform usage.");
    }

    touch_start(integer number)
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Set font name to Courier New
        CommandList = osSetFontName(CommandList, "Courier New");

        // Draw text "Hello World!" at (10, 10)
        CommandList = osMovePen(CommandList, 10, 10);
        CommandList = osDrawText(CommandList, "Hello World!");

        // Apply rotation and translation transforms
        CommandList = osDrawRotationTransform(CommandList, -45.0);
        CommandList = osDrawTranslationTransform(CommandList, -80.0, 160.0);
        CommandList = osDrawText(CommandList, "Hello World!");

        // Reset all transforms
        CommandList = osDrawResetTransform(CommandList);

        // Apply rotation and translation transforms again
        CommandList = osDrawRotationTransform(CommandList, 45.0);
        CommandList = osDrawTranslationTransform(CommandList, 100.0, -20.0);
        CommandList = osDrawText(CommandList, "Hello World!");

        // Reset all transforms
        CommandList = osDrawResetTransform(CommandList);

        // Move pen to (100, 225) and draw text
        CommandList = osMovePen(CommandList, 100, 225);
        CommandList = osDrawText(CommandList, "Hello World!");

        // Display the drawn text
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
