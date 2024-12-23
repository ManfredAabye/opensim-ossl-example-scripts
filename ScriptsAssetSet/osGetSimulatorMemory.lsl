/*
integer osGetSimulatorMemory();
In the state_entry event, the script initializes by retrieving the memory used by the OpenSimulator instance using osGetSimulatorMemory. 
It then sets the text above the object to display this memory usage.

In the touch event, whenever an avatar touches the object, the script updates by again retrieving the memory used by the OpenSimulator instance using osGetSimulatorMemory. 
It then updates the text above the object to display this updated memory usage.

This script allows avatars to check the memory usage of the OpenSimulator instance by touching the object, and the displayed text will update accordingly.
*/

// Example / Sample Script to show function use.

integer TotMemUsed;

default
{
    state_entry()
    {
        // Get the memory used by the OpenSimulator instance
        TotMemUsed = osGetSimulatorMemory();
        
        // Display the memory usage as text above the object
        llSetText((string)TotMemUsed + " Memory by the OpenSimulator Instance", <0.0, 1.0, 0.0>, 1.0);
    }
    
    touch(integer num)
    {
        // Get the memory used by the OpenSimulator instance
        TotMemUsed = osGetSimulatorMemory();
        
        // Display the memory usage as text above the object
        llSetText((string)TotMemUsed + " Memory by the OpenSimulator Instance", <0.0, 1.0, 0.0>, 1.0);
    }
}
