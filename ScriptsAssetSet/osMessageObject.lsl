/*
    In the state_entry() event, the object sends a message to the local chat (channel 0) instructing users to touch it to initiate the script.
    When the object is touched (touch_end() event), it specifies the UUID of the target object to which the message will be sent. (You need to replace "UUID" with the actual UUID of the target object.)
    It then defines the message to be sent (sSentence).
    Finally, it uses the osMessageObject() function to send the message (sSentence) to the target object specified by kTargetObj.

Make sure to replace "UUID" with the valid UUID of the target object in order for the script to function correctly.
*/

default
{
    state_entry()
    {
        // When the object enters the default state, it sends a message to the local chat (channel 0)
        // instructing users to touch it to initiate the script.
        llSay(0, "Touch me to use osMessageObject to message an object");
    }
    
    touch_end(integer total_num)
    {
        // Define the UUID of the target object to which the message will be sent
        key kTargetObj = "UUID"; //INSERT A VALID Object UUID here
        
        // Define the message to be sent
        string sSentence = "This message sent from a Sending object using osMessageObject";
        
        // Use osMessageObject() function to send the message to the target object
        osMessageObject(kTargetObj, sSentence);
    }
}


/*     Reciever script 
    In the state_entry() event, the object sends a message to the local chat (channel 0) indicating that it is ready to receive messages. It also provides instructions on how to replace the UUID in the osMessageObject script to ensure proper functionality.
    The dataserver(key query_id, string data) event is triggered when the object receives data from a dataserver request. In this case, it's triggered when a message is received from osMessageObject().
    Inside the dataserver() event, the received message (data) and the associated query_id are displayed in the local chat (channel 0) using llSay().
*/
/*

// Place this script in the Receiver prim.
default
{
    state_entry()
    {
        // When the object enters the default state, it sends a message to the local chat (channel 0)
        // indicating that the receiver is ready to receive messages. It also provides instructions
        // on how to replace the UUID in the osMessageObject script.
        llSay(0, "osMessageObject Receiver Ready\nPlease replace UUID in osMessageObject Script (line 31) kTargetObj = "+(string)llGetKey());
    }
    
    dataserver(key query_id, string data)
    {
        // This event is triggered when the object receives data from a dataserver request.
        // In this case, it's triggered when a message is received from osMessageObject().
        
        // Display the received message and the associated query_id in the local chat (channel 0).
        llSay(0, "RECEIVER: The message received.\n\t query_id = "+(string)query_id+"\n\t msg = "+data);
    }
}

*/
