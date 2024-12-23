/*
string osDrawText(string drawList, string text)
    The provided script demonstrates the usage of the osDrawText() function, which appends text drawing command to the string provided in drawList.

    It starts with a comment block describing the function's purpose.

    In the default state, the state_entry() event handler is triggered when the script enters its default state. It defines the string CommandList to store drawing commands.

    The pen is moved to the upper left corner at coordinates (10, 10) using osMovePen() function.

    The text "Hello, World!" is drawn at the current pen position using osDrawText() function.

    Finally, the drawn text is displayed using osSetDynamicTextureData() function to set dynamic texture data.
*/

// Example of osDrawText
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";

        // Move pen to upper left corner at <10,10>
        CommandList = osMovePen(CommandList, 10, 10);

        // Draw the text "Hello, World!"
        CommandList = osDrawText(CommandList, "Hello, World!");

        // Display the drawn text
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}
