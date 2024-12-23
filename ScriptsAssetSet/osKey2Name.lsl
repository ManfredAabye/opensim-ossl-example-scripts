/*
This script, when placed inside an object in the OpenSim environment, will execute state_entry() when the object is initialized. 
Inside this function, it retrieves the UUID of the owner using llGetOwner() and then converts that UUID into the owner's name using osKey2Name(). 
Finally, it sends a message to the owner containing their name using llOwnerSay().
*/

//osKey2Name() example, by Tom Earth.

default
{
    state_entry()
    {
        // Retrieve the UUID of the owner and convert it to their name
        string owner_name = osKey2Name(llGetOwner());

        // Send a message to the owner containing their name
        llOwnerSay("Your name is: " + owner_name); 
    }
}
