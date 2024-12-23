/*
osRegionNotice(string message)
osRegionNotice(key agentID, string message)
    state_entry(): This is an event handler that is triggered when the script initializes or resets. In this script, it sends a message to channel 0 informing users to touch for sending a notice to the region.

    touch_start(integer total_num): This event handler is triggered when the object is touched by an avatar. It defines the message to be sent and then calls the osRegionNotice function with the message as the parameter. This function sends the notice to all users in the entire region.

Overall, this script allows users to send a notice to the entire region by touching an object with this script inside an OpenSim region. The notice message is defined within the script and can be customized as needed.
*/


// osRegionNotice Script Example

default
{
    state_entry()
    {
        llSay(0, "Touch to send a Notice to the region"); // Sends a message to channel 0 indicating to touch for sending a notice.
    }

    touch_start(integer total_num)
    {
        string message = "This is a test Notice to this region using osRegionNotice"; // Define the message to be sent.
        osRegionNotice(message); // Sends the notice to the entire region.
    }
}
