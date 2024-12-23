/*
This comment provides a breakdown of each section of the script and explains what each part does, making it easier for others (or yourself) to understand the purpose and functionality of the code.
*/

// Define variables to hold title, subtitle, main text, additional text, and channel for communication
string title = "";
string subtitle = "";
string text = "";
string add = "";
integer channel = 0; // if this is >= 0, llSay on that channel on updates

// Function to compile text by setting values for title, subtitle, main text, and additional text
push_text()
{
    compile_text(); // Compile the text
    draw_text();    // Draw the text
}

// Function to set values for title, subtitle, main text, and additional text
compile_text()
{
    title = "Some Title"; // Set the title
    subtitle = "Some subtitle"; // Set the subtitle

    text = "Plenty of text for the main body.\n"; // Set the main text
    text += "You need to manual do line breaks\n"; // Append to the main text
    text += "here.  No word wrap yet."; // Append to the main text

    add = "Additional text at the bottom"; // Set the additional text
}

// Function to draw the text using dynamic texture
draw_text()
{
    // Construct a list of drawing commands to display the text
    string drawList = "MoveTo 40,80; PenColour RED; FontSize 48; Text " + title + ";";
    drawList += "MoveTo 160,160; FontSize 32; Text " + subtitle + ";";
    drawList += "PenColour BLACK; MoveTo 40,220; FontSize 24; Text " + text + ";";
    drawList += "PenColour RED; FontName Times New Roman; MoveTo 40,900; Text " + add + ";"; 
    
    // Set the dynamic texture data to display the text
    osSetDynamicTextureData("", "vector", drawList, "1024", 0);
}

// Default state for the object
default
{
    // This event is triggered when the script starts running
    state_entry()
    {
        push_text(); // Call the push_text function to display the text
    }
   
    // This event is triggered when an avatar touches the object
    touch_start(integer count)
    {
        push_text(); // Call the push_text function to update and display the text
        
        // If a valid channel is specified, send the main text on that channel
        if (channel >= 0) {
            llSay(channel, text);    
        }
    }
}
