/*
key osSetDynamicTextureDataBlendFace(string dynamicID, string contentType, string data, string extraParams, integer blend, integer disp, integer timer, integer alpha, integer face)
This script numbers each face of the prim by drawing text on each face using vector graphics. The NumberEachFace function calculates the position for each face to center the text and then draws the text on the face. 
The default state entry function calls NumberEachFace to initialize the numbers on each face when the script starts, and the changed event function checks for changes in the prim's shape and updates the numbers accordingly.
*/

// Example of osSetDynamicTextureDataBlendFace used to put a number on each face of a prim
 
// OpenSim Script Language: default

// Define the default font name and font size
string FontName = "Arial";
integer FontSize = 128;

// Function to number each face of the prim
NumberEachFace() {
    // Get the total number of sides (faces) of the prim
    integer face = llGetNumberOfSides();
    
    // Loop through each face of the prim
    while (face--) {
        // Convert the face index to a string
        string text = (string)face;
        
        // Get the size of the text using the specified font name and font size
        vector size = osGetDrawStringSize("vector", text, FontName, FontSize);
        
        // Calculate the X and Y positions to center the text on the face
        integer xpos = (256 - (integer)size.x) >> 1; // Shift right by 1 to divide by 2
        integer ypos = (256 - (integer)size.y) >> 1; // Shift right by 1 to divide by 2
        
        // Initialize a string to store drawing commands for the current face
        string commandList = "";
        
        // Move the pen to the calculated position
        commandList = osMovePen(commandList, xpos, ypos);
        
        // Set the font name for drawing text
        commandList = osSetFontName(commandList, FontName);
        
        // Set the font size for drawing text
        commandList = osSetFontSize(commandList, FontSize);
        
        // Draw the text on the face using the calculated position
        commandList = osDrawText(commandList, text);
        
        // Set the dynamic texture data for the current face with blending
        // osSetDynamicTextureDataBlendFace(texture_name, texture_format, data, size, loop, face)
        // texture_name: Empty string to update the current texture
        // texture_format: "vector" for vector graphics data
        // data: Drawing commands for the current face
        // size: Size of the texture in the format "width:height"
        // loop: FALSE to update the texture once
        // face: Index of the face to update
        osSetDynamicTextureDataBlendFace("", "vector", commandList, "width:256,height:256", FALSE, 2, 0, 255, face);
    }
}

default {
    state_entry() {
        // Call the NumberEachFace function to number each face of the prim
        NumberEachFace();
    }
    
    // This function is called when there is a change in the prim's properties
    changed(integer change) {
        // Check if the shape of the prim has changed
        if (change & CHANGED_SHAPE)
            // If the shape has changed, call the NumberEachFace function again to update the numbers on each face
            NumberEachFace();
    }
}
