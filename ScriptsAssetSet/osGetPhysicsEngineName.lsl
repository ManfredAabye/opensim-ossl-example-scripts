/*
string osGetPhysicsEngineName()
When an avatar touches the object containing this script, it will output a message in the chat channel prompting to see the usage of osGetPhysicsEngineName. 
Upon touching the object, it will then retrieve the name of the physics engine currently in use and output it to the chat.
*/


//
// osGetPhysicsEngineName Script Example
// Author: djphil
//
 
default
{
    state_entry()
    {
        // Output a message prompting touch to see the usage of osGetPhysicsEngineName
        llSay(PUBLIC_CHANNEL, "Touch to see osGetPhysicsEngineName usage.");
    }

    touch_start(integer number)
    {
        // Get the name of the physics engine
        string physicsEngineName = osGetPhysicsEngineName();

        // Output the name of the physics engine to the chat
        llSay(PUBLIC_CHANNEL, "The physics engine name is " + physicsEngineName);
    }
}
