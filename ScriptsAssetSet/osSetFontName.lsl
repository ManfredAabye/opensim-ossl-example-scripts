/*
string osSetFontName(string drawList, string fontName)
    The script initializes variables for controlling text properties such as font name, font size, and text position.
    The DrawText() function is defined to draw text using the specified font name and font size.
    In the state_entry() event, the script sets up the default text to be displayed with the default font settings and calls DrawText() to render the text.
    When an avatar touches the object (touch_start() event), the script toggles between different font settings based on the value of the iFlag variable and updates the text accordingly using the DrawText() function.
*/


integer iFlag = TRUE;           // Flag to control the state of the text
string sCommandList = "";      // Storage for drawing commands
string sFontName = "Arial";    // Default font name
integer iFontSize = 14;        // Default font size
integer iX = 10;               // X-coordinate for text positioning
integer iY = 10;               // Y-coordinate for text positioning
string sText;                  // Text to display

// Function to draw text using specified font name and font size
DrawText()
{
    // Set the font name for drawing
    sCommandList = osSetFontName(sCommandList, sFontName);
    
    // Set the font size for drawing
    sCommandList = osSetFontSize(sCommandList, iFontSize);
    
    // Move the pen to the specified coordinates
    sCommandList = osMovePen(sCommandList, iX, iY);
    
    // Draw the text
    sCommandList = osDrawText(sCommandList, sText);
    
    // Draw the image with the specified drawing commands
    osSetDynamicTextureData("", "vector", sCommandList, "width:512,height:512", 0);
}

default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in local chat to prompt avatars to touch the object
        llSay(0, "Touch to see how changing osSetFontName & osSetFontName work");
        
        // Initialize the text to be displayed
        sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
        
        // Call the function to draw text with the default font
        DrawText();
    }

    // This function is called when an avatar touches the object containing the script
    touch_start(integer num)
    {
        // Toggle between different font settings based on the flag value
        if(iFlag)
        {
            iX = 10;
            iY = 50;
            iFlag = FALSE;
            sFontName = "Times";  // Change font name
            iFontSize = 18;       // Change font size
            sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
            DrawText();           // Call the function to draw text with new font settings
        }
        else
        {
            iX = 10;
            iY = 100;
            iFlag = TRUE;
            sFontName = "Courier"; // Change font name
            iFontSize = 22;       // Change font size
            sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
            DrawText();           // Call the function to draw text with new font settings
        }
    }
}
