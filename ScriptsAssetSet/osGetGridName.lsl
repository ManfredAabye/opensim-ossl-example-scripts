/*
string osGetGridName()
This function retrieves the name of the grid.
*/

//
// Example of osGetGridName()
// Returns the value of gridname = "Hippogrid" in OpenSim.ini under [GridInfo] section.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the name of the grid using osGetGridName().
        string grid_name = osGetGridName();

        // Display the name of the grid.
        llSay(0, "Grid Name = " + grid_name);
    }
}
