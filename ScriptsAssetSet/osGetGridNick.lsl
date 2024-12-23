/*
string osGetGridNick()
This function retrieves the nickname of the grid.
*/

//
// Example of osGetGridNick()
// Returns the value of gridnick = "hippogrid" in OpenSim.ini under [GridInfo] section.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the nickname of the grid using osGetGridNick().
        string grid_nick = osGetGridNick();

        // Display the nickname of the grid.
        llSay(0, "Grid Nick Name = " + grid_nick);
    }
}
