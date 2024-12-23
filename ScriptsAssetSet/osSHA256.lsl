/*
string osSHA256(string input)
This script prompts avatars in public chat to touch the object. 
When an avatar touches the object, it calculates the SHA256 hash of the input string "OpenSimulator" 
using the osSHA256 function and then says the hash value in public chat.
*/

//
// osSHA256 Script Example
// Author: djphil
//
 
// OpenSim Script Language: default
default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Say a message in public chat to prompt avatars to touch the object
        llSay(PUBLIC_CHANNEL, "Touch to see osSHA256 usage.");
    }
 
    // This function is called when an avatar touches the object containing the script
    touch_start(integer number)
    {
        // Define a string input
        string input = "OpenSimulator";
        
        // Calculate the SHA256 hash of the input string using the osSHA256 function
        string sha256Value = osSHA256(input);
        
        // Say the SHA256 hash value in public chat
        llSay(PUBLIC_CHANNEL, "The sha256 value of input \"" + input + "\" is:\n" + sha256Value);
    }
}
