/*
string osSetPenColor(string drawList, string color)

string osSetPenColor(string drawList, vector color)
string osSetPenColor(string drawList, vector color, float alpha)

    osSetPenColor(string drawList, string color) Appends a PenColor drawing command to the string provided in drawList and returns the result. 

This sets the pen's drawing color to either the specified named .NET color named colors or to a 32-bit color value (formatted as eight hexadecimal digits in the format aarrggbb, representing the eight-bit alpha, red, green and blue channels).

For full opacity, use an alpha value of FF (e.g. FFFF0000 for red); for varying degrees of transparency, reduce the alpha value (e.g. 800000FF for semi-transparent blue).

The color names and hexadecimal color representations are not case-sensitive.

    osSetPenColor(string drawList, vector color) converts vector color to the hexadecimal color with a alpha of 1.0 (FF) and appends the drawing command. 

    osSetPenColor(string drawList, vector color, float alpha) converts vector color and alpha to the hexadecimal color and appends the drawing command. 


NOTE : This function replaces the deprecated OsSetPenColour function.
Threat Level 	This function does not do a threat level check
Permissions 	Use of this function is always allowed by default
Extra Delay 	0 seconds
Example(s) */
 
string hexDigits = "0123456789abcdef";
list colorNames = [
    "AliceBlue", "AntiqueWhite", "Aqua", "Aquamarine", "Azure", "Beige", "Bisque",
    "Black", "BlanchedAlmond", "Blue", "BlueViolet", "Brown", "BurlyWood",
    "CadetBlue", "Chartreuse", "Chocolate", "Coral", "CornflowerBlue", "Cornsilk",
    "Crimson", "Cyan", "DarkBlue", "DarkCyan", "DarkGoldenrod", "DarkGrey",
    "DarkGreen", "DarkKhaki", "DarkMagenta", "DarkOliveGreen", "DarkOrange",
    "DarkOrchid", "DarkRed", "DarkSalmon", "DarkSeaGreen", "DarkSlateBlue",
    "DarkSlateGrey", "DarkTurquoise", "DarkViolet", "DeepPink", "DeepSkyBlue",
    "DimGrey", "DodgerBlue", "FireBrick", "FloralWhite", "ForestGreen", "Fuchsia",
    "Gainsboro", "GhostWhite", "Gold", "Goldenrod", "Grey", "Green", "GreenYellow",
    "Honeydew", "HotPink", "IndianRed", "Indigo", "Ivory", "Khaki", "Lavender",
    "LavenderBlush", "LawnGreen", "LemonChiffon", "LightBlue", "LightCoral",
    "LightCyan", "LightGoldenrodYellow", "LightGreen", "LightGrey", "LightPink",
    "LightSalmon", "LightSeaGreen", "LightSkyBlue", "LightSlateGrey",
    "LightSteelBlue", "LightYellow", "Lime", "LimeGreen", "Linen", "Magenta",
    "Maroon", "MediumAquamarine", "MediumBlue", "MediumOrchid", "MediumPurple",
    "MediumSeaGreen", "MediumSlateBlue", "MediumSpringGreen", "MediumTurquoise",
    "MediumVioletRed", "MidnightBlue", "MintCream", "MistyRose", "Moccasin",
    "NavajoWhite", "Navy", "OldLace", "Olive", "OliveDrab", "Orange", "OrangeRed",
    "Orchid", "PaleGoldenrod", "PaleGreen", "PaleTurquoise", "PaleVioletRed",
    "PapayaWhip", "PeachPuff", "Peru", "Pink", "Plum", "PowderBlue", "Purple",
    "Red", "RosyBrown", "RoyalBlue", "SaddleBrown", "Salmon", "SandyBrown",
    "SeaGreen", "Seashell", "Sienna", "Silver", "SkyBlue", "SlateBlue", "SlateGrey",
    "Snow", "SpringGreen", "SteelBlue", "Tan", "Teal", "Thistle", "Tomato",
    "Turquoise", "Violet", "Wheat", "White", "WhiteSmoke", "Yellow", "YellowGreen"
];
 
default
{
    state_entry()
    {
        // Storage for our drawing commands
        string CommandList = "";
        integer i;
        // Set the pen width to 1 pixel
        CommandList = osSetPenSize(CommandList, 1);
 
        // draw each named color as a single horizontal line
        for (i = 0; i < 140; ++i)
        {
            // Set the pen to the next color name in our list
            CommandList = osSetPenColor(CommandList, llList2String( colorNames, i));
            // Now draw a line in that color
            CommandList = osDrawLine(CommandList, 0, i, 255, i);
        }
 
        // Now let's fill up the remainder with lines of random colors, leaving a gap of 20 lines.
        for (i = 161; i < 256; ++i)
        {
            // give it an opaque alpha
            string thisColor = "ff";
            integer j;
 
            // then choose six random hex digits for the color
            for (j = 0; j < 6; ++j)
            {
                integer k = (integer)llFrand(16.0);
                thisColor += llGetSubString(hexDigits, k, k);
            }
            CommandList = osSetPenColor(CommandList, thisColor);
            CommandList = osDrawLine(CommandList, 0, i, 255, i);
        }
        // Now generate the texture and apply it to the prim
        osSetDynamicTextureData("", "vector", CommandList, "width:256,height:256", 0);
    }
}