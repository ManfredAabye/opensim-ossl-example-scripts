/*
This script defines a default state with two event handlers:

state_entry: This event handler is triggered when the object containing the script is initialized or reset. 
It sends a message "I am Alive!" using the llSay function to indicate that the script is active.

touch_start: This event handler is triggered when the object is touched by an avatar. 
It sends a message "Touched." using the llSay function to indicate that the object has been touched. 
The integer number_of_touchs parameter represents the number of touches that triggered the event, 
although it is not used in this specific example.
*/

// Define a default state with event handlers for state entry and touch start
default
{
    // Define an event handler for when the state is entered
    state_entry()
    {
        // Send a message indicating that the script is alive
        llSay(0, "I am Alive!");
    }

    // Define an event handler for when the object is touched
    touch_start(integer number_of_touchs)
    {
        // Send a message indicating that the object was touched
        llSay(0, "Touched.");
    }
}

