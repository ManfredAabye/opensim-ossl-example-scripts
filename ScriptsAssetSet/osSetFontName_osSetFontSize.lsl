/*
string osSetFontName(string drawList, string fontName)
    The script defines variables to control font settings, text positioning, and the text to display.
    The DrawText() function sets the font name and font size, moves the pen to the specified position, draws the text, and applies the drawing commands to the prim as a dynamic texture.
    In the state_entry() event, the script initializes the text and draws it on the prim when the script starts.
    In the touch_start() event, the script toggles between different font names and font sizes based on the iFlag variable, updates the text accordingly, and redraws it on the prim.
*/


// Define variables
integer iFlag = TRUE;            // Flag to control font change
string sCommandList = "";        // Storage for drawing commands
string sFontName = "Arial";      // Default font name
integer iFontSize = 14;          // Default font size
integer iX = 10;                 // X-coordinate for text positioning
integer iY = 10;                 // Y-coordinate for text positioning
string sText;                    // Text to display

// Function to draw text on the prim
DrawText()
{
    // Set font name and font size for drawing
    sCommandList = osSetFontName(sCommandList, sFontName);
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
    state_entry()
    {
        // Initialize text and draw on the prim
        llSay(0, "Touch to see how changing osSetFontName & osSetFontName work");
        sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
        DrawText();
    }
    
    touch_start(integer num)
    {
        // Toggle between font names and font sizes
        if (iFlag)
        {
            iX = 10;
            iY = 50;
            iFlag = FALSE;
            sFontName = "Times";
            iFontSize = 18;
            sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
            DrawText();
        }
        else
        {
            iX = 10;
            iY = 100;
            iFlag = TRUE;
            sFontName = "Courier";
            iFontSize = 22;
            sText = "FontName = " + sFontName + "\nFontSize = " + (string)iFontSize;
            DrawText();
        }
    }
}
