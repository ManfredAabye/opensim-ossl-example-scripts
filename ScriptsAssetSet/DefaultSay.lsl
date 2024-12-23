/*
This script defines a default state with an event handler for the state's entry. 
When the object containing this script is initialized or reset, 
the state_entry event is triggered, and it sends a message "I am Alive!" using the llSay function. 
The 0 parameter in llSay represents the public chat channel, 
indicating that the message will be broadcasted to everyone in the vicinity.
*/

// Define a default state with an event handler for state entry
default
{
    // Define an event handler for when the state is entered
    state_entry()
    {
        // Send a message indicating that the script is alive
        llSay(0, "I am Alive!");
    }
}


