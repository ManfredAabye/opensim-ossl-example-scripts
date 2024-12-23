/*
This script listens for messages on channel 1 and processes them to determine if the provided key represents an NPC (non-player character) or an agent (avatar). 
It uses osIsNpc to check if the key represents an NPC and llGetAgentSize to check if the key represents an agent. 
Based on the result, it informs the owner of the object about the nature of the key (NPC, agent, or not existing).
*/

// Author: mewtwo0641
 
// Default event handler
default
{
    state_entry()
    {
        // Start listening on channel 1 for messages from the owner
        llListen(1, "", llGetOwner(), "");    
    }
 
    // Listen event handler
    listen(integer channel , string name, key id, string message)
    {
        // Check if the message was sent on channel 1
        if(channel == 1)
        {
            // Get information about the key sent in the message
            integer isNPC = osIsNpc((key)message); // Check if the key represents an NPC
            string keyInfo = llKey2Name((key)message) + " (" + message + ")"; // Get the name and key information
 
            // Check if the key represents an NPC
            if(isNPC)
            {
                // Inform the owner that the key represents an NPC
                llOwnerSay(keyInfo + " is an NPC.");
            }
            else // The key does not represent an NPC
            {
                // Check if the key represents an agent (avatar)
                if(llGetAgentSize((key)message) != ZERO_VECTOR)
                {
                    // Inform the owner that the key represents an agent and not an NPC
                    llOwnerSay(keyInfo + " is an AGENT and not an NPC");
                }
                else
                {
                    // Inform the owner that the key is either not an NPC or the NPC does not exist
                    llOwnerSay(keyInfo + " is either not an NPC or the NPC does not exist.");
                }
            } 
        }   
    }
}
