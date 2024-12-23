/*
integer osCheckODE()
    default: This is the default state of the script.
    state_entry(): This event handler function is triggered when the script enters its default state.
    if (osCheckODE()): This line checks if the Open Dynamics Engine (ODE) is being used as the physics engine.
    { llOwnerSay("This script requires Bullet or ubOde physics engine"); }: This block of code is executed if ODE is being used. 
    It sends a message to the owner of the object via chat to inform them that the script requires either the Bullet or ubOde physics engine to function properly.
    llSleep(5.0);: This line causes the script to pause execution for 5 seconds. 
    This delay may be intended to ensure that the chat message is seen by the owner before the script terminates.
    llDie();: This function terminates the script immediately after the 5-second delay. 
    This ensures that the script doesn't continue executing any further instructions after informing the owner about the physics engine requirement.
*/

//
// Example of osCheckODE()
// Returns 1 if OpenDynamicsEngine is enable else return 0
//
 
default
{
    state_entry()
    {
        // Check if the Open Dynamics Engine (ODE) physics engine is being used
        if (osCheckODE())
        {
            // If ODE is being used, inform the owner via chat
            llOwnerSay("This script requires Bullet or ubOde physics engine");
        }
        
        // Delay script execution for 5 seconds (to allow time for the chat message to be delivered)
        llSleep(5.0);
        
        // Terminate the script
        llDie();
    }
}
