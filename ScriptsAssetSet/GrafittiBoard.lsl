/*
This script implements a graffiti board in OpenSim. 
Users can add text to the board by sending messages to a specified channel. 
The script listens on this channel and responds to commands to add text or clear the board. 
The graffiti text is word-wrapped to fit within a specified width and rendered on a dynamic texture module.
*/

// Grafitti board 0.0.2 for OpenSim
// By Justin Clark-Casey (justincc)
// http://justincc.wordpress.com

// This script is available under the BSD License

// Declare a variable to store the current graffiti text
string text = "";

// Define the channel on which the script listens for commands
integer LISTENING_CHANNEL = 43;

// Define the width of characters for word wrapping
integer CHARS_WIDTH = 42;

// Add graffiti to the board with word wrapping
addGraffiti(string message)
{
    // Word wrap the message if it's longer than the specified width
    while (llStringLength(message) > CHARS_WIDTH)
    {
        text += "\n\n" + llGetSubString(message, 0, CHARS_WIDTH - 1);
        message = llDeleteSubString(message, 0, CHARS_WIDTH - 1);
    }
    
    // Add the remaining message
    text += "\n\n" + message;
}

// Clear the existing graffiti
clearGraffiti()
{
    text = "";
}

// Draw the graffiti on a dynamic texture module
draw()
{
    // Construct a draw list for rendering the graffiti
    string drawList = "PenColour BLACK; MoveTo 40,220; FontSize 32; Text " + text + ";";

    // Set the dynamic texture data to render the graffiti
    osSetDynamicTextureData("", "vector", drawList, "1024", 0);
}

// Define the default state
default
{
    // Event handler for state entry
    state_entry()
    {      
        // Set the instructions on how to use the graffiti board
        llSetText(
            "Say /" + LISTENING_CHANNEL_STRING + " <message> to add text."
            + "  Say /" + LISTENING_CHANNEL_STRING
            + " !clear to clear board", 
            <0.0, 1.0, 0.0>, 1.0);
        
        // Start listening on the defined channel
        llListen(LISTENING_CHANNEL, "", NULL_KEY, "");      
        
        // Add initial graffiti messages
        addGraffiti("justincc's graffiti board v0.0.2");
        addGraffiti("Now with primitive word wrap!");
        
        // Draw the graffiti
        draw();        
    }
    
    // Event handler for listening on the defined channel
    listen(integer channel, string name, key id, string message)
    {
        // Check the received message
        if (message == "!clear")
        {
            // Clear the graffiti board
            clearGraffiti();
        }
        else
        {
            // Add the received message to the graffiti board
            addGraffiti(message);
        }
        
        // Draw the updated graffiti
        draw();
    }
}
