/*
integer osResetEnvironment(integer ParcelOrRegion, integer transition)
    The script initializes two integer variables: transition with a value of 3, and switch without an initial value specified.
    Inside the default state, in the state_entry() event handler, it sends messages to the public channel indicating how to use the script and the value of the transition variable.
    Inside the touch_start() event handler, it first declares an integer variable result.
    It then checks if the value of switch is not equal to its current value using the expression if (switch = !switch). This appears to be a toggle mechanism, switching the value of switch between 0 and 1.
    Depending on the value of switch, it calls the osResetEnvironment() function with appropriate arguments (switch and transition).
    It then checks the value of result and the value of switch to determine success or failure of the operation and sends corresponding messages to the public channel.

Overall, this script seems to handle toggling and resetting environment settings in a virtual environment, providing feedback to users through public channel messages.
*/

//
// osResetEnvironment Script Example
// Author: djphil
//
 
integer transition = 3;  // Declaring and initializing an integer variable named transition with a value of 3
integer switch;          // Declaring an integer variable named switch
 
default
{
    state_entry()  // Event handler for when the script enters its default state
    {
        llSay(PUBLIC_CHANNEL, "Touch to see osResetEnvironment usage.");  // Sends a message to the public channel
        llSay(PUBLIC_CHANNEL, "Transition: " + (string)transition + " second(s).");  // Sends a message with the value of transition variable to the public channel
    }
 
    touch_start(integer number)  // Event handler for when an object is touched
    {
        integer result;  // Declaring an integer variable named result
 
        if (switch = !switch)  // Checks if the value of switch is not equal to its current value
        {
            result = osResetEnvironment(switch, transition);  // Calls the osResetEnvironment function with the current value of switch and the transition variable
        }
        else
        {
            result = osResetEnvironment(switch, transition);  // Calls the osResetEnvironment function with the current value of switch and the transition variable
        }
 
        if (switch == 1 && result > 0)  // Checks if switch is equal to 1 and result is greater than 0
        {
            llSay(PUBLIC_CHANNEL, "The parcel environment was removed with success.");  // Sends a success message to the public channel
            llSay(PUBLIC_CHANNEL, "The region environment is now used.");  // Sends a message indicating the region environment is now used
        }
        else if (switch == 1 && result < 0)  // Checks if switch is equal to 1 and result is less than 0
        {
            llSay(PUBLIC_CHANNEL, "The parcel environment was removed without success.");  // Sends a failure message to the public channel
        }
        else if (switch == 0 && result > 0)  // Checks if switch is equal to 0 and result is greater than 0
        {
            llSay(PUBLIC_CHANNEL, "The region environment was set to the default with success.");  // Sends a success message to the public channel
        }
        else if (switch == 0 && result < 0)  // Checks if switch is equal to 0 and result is less than 0
        {
            llSay(PUBLIC_CHANNEL, "The region environment was set to the default without success.");  // Sends a failure message to the public channel
        }
    }
}
