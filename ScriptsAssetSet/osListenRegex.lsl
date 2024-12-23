/*
integer osListenRegex(integer channelID, string name, key ID, string msg, integer regexBitfield)
This script allows an object in an OpenSim environment to listen on a specified channel for messages from avatars whose names match a specific pattern. 
When an avatar touches the object, the listener is toggled on/off. When the listener is active, 
it responds to messages on the channel from avatars with matching names and outputs information about the received message. 
Additionally, it automatically turns off the listener after 30 seconds to avoid continuous listening.
*/

// osListenRegex Script Example
// Author: djphil
 
integer channelID = PUBLIC_CHANNEL; // Channel ID for communication
integer handler; // Listener handler
integer swith; // Switch for toggling listener state

default
{
    state_entry()
    {
        // Initialize object state
        llSay(PUBLIC_CHANNEL, "Touch to see osListenRegex usage.");
        llSay(PUBLIC_CHANNEL, "This with the use of the Regex Bitfield OS_LISTEN_REGEX_NAME.");
        llSetText("[OFF]", <1.0, 1.0, 1.0>, 1.0); // Set object text to indicate listener state
    }

    touch_start(integer number)
    {
        // Toggle listener state
        if (swith = !swith)
        {
            string name = llDetectedName(0); // Get the name of the avatar who touched the object
            handler = osListenRegex(channelID, name, NULL_KEY, "", OS_LISTEN_REGEX_NAME); // Start listening on the channel for messages from avatars with the specified name
            llSay(PUBLIC_CHANNEL, "The listen regex on channel " + (string)channelID + " is open.");
            llSay(PUBLIC_CHANNEL, "The regex name is " + (string)name);
            llSetText("[ON]", <1.0, 1.0, 1.0>, 1.0); // Update object text to indicate listener is on
            llSetTimerEvent(30.0); // Set a timer event to automatically turn off the listener after 30 seconds
        }
        else
        {
            // Turn off the listener
            llSetTimerEvent(0.0); // Cancel the timer event
            llListenRemove(handler); // Remove the listener
            llSay(PUBLIC_CHANNEL, "The listen regex on channel " + (string)channelID + " is closed."); // Inform about closing the listener
            llSetText("[OFF]", <1.0, 1.0, 1.0>, 1.0); // Update object text to indicate listener is off
        }
    }

    listen(integer channel, string name, key id, string message)
    {
        // Listen event handler
        if (channel == channelID)
        {
            // Respond to messages received on the specified channel
            llSay(PUBLIC_CHANNEL, (string)channel + ") " + (string)id + " " + name + " " + message);
        }
    }

    timer()
    {
        // Timer event handler
        swith = !swith; // Toggle the listener state
        llSetTimerEvent(0.0); // Cancel the timer event
        llListenRemove(handler); // Remove the listener
        llSay(PUBLIC_CHANNEL, "The listen regex on channel " + (string)channelID + " is closed."); // Inform about closing the listener
        llSetText("[OFF]", <1.0, 1.0, 1.0>, 1.0); // Update object text to indicate listener is off
    }
}
