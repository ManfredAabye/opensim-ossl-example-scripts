/*
integer osGetSimulatorMemoryKB();
In the state_entry event, the script initializes by retrieving the memory used by the OpenSimulator instance in kilobytes using osGetSimulatorMemoryKB. 
It then sets the text above the object to display this memory usage.

In the touch event, whenever an avatar touches the object, the script updates by again retrieving the memory used by the OpenSimulator instance in kilobytes using osGetSimulatorMemoryKB. 
It then updates the text above the object to display this updated memory usage in kilobytes.
*/


// Simple Unformatted Output
 
integer TotMemUsed;

default
{
    state_entry()
    {
        // Get the memory used by the OpenSimulator instance in kilobytes
        TotMemUsed = osGetSimulatorMemoryKB();
        
        // Display the memory usage as text above the object
        llSetText((string)TotMemUsed + " KB Memory by the OpenSimulator Instance", <0.0, 1.0, 0.0>, 1.0);
    }

    touch(integer number)
    {
        // Get the memory used by the OpenSimulator instance in kilobytes
        TotMemUsed = osGetSimulatorMemoryKB();
        
        // Display the memory usage as text above the object
        llSetText((string)TotMemUsed + " KB Memory by the OpenSimulator Instance", <0.0, 1.0, 0.0>, 1.0);
    }
}
