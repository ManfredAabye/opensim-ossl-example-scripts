/*
string osGetPhysicsEngineType()
When an avatar touches the object containing this script, it will output a message in the chat channel prompting to see the usage of osGetPhysicsEngineType. 
Upon touching the object, it will then retrieve the type of the physics engine currently in use and output a message indicating whether the specified physics engine type is detected or not.
*/


//
// osGetPhysicsEngineType Script Example
// Author: djphil
//
 
default
{
    state_entry()
    {
        // Output a message prompting touch to see the usage of osGetPhysicsEngineType
        llSay(PUBLIC_CHANNEL, "Touch to see osGetPhysicsEngineType usage.");
    }

    touch_start(integer number)
    {
        // Get the type of the physics engine
        string physicsEngineType = osGetPhysicsEngineType();

        // Check the type of the physics engine and output a message accordingly
        if (physicsEngineType == "ubODE")
        {
            llSay(PUBLIC_CHANNEL, physicsEngineType + " is detected ...");
        }
        else
        {
            llSay(PUBLIC_CHANNEL, physicsEngineType + " is not detected ...");
        }
    }
}
