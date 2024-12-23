/*
string llGetRenderMaterial( integer face );
This script is designed to be run in a virtual environment like OpenSimulator (OpenSim). 
It's a simple script that gets the number of sides (faces) of the object it's attached to and then iterates through each side, 
printing out the side number and its render material in local chat.
*/

//Tells (on chat) the Material keys / Material names on 6 sides

default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Initialize a variable 'i' to 0
        integer i = 0;
        // Get the number of sides (faces) of the object
        integer max = llGetNumberOfSides();
        
        // Loop through each side of the object
        while(i < max)
        {
            // Say in chat the side number and its render material
            // llSay(0, "message") sends a message to channel 0 (local chat)
            // Concatenate strings and convert integers to strings using (string)
            llSay(0, "Side " + (string)i + " Material is: " + (string)llGetRenderMaterial(i));
            
            // Increment the side counter
            ++i;
        }
    }
}

