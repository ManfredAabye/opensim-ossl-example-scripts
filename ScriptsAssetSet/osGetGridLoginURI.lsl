/*
string osGetGridLoginURI()
This function retrieves the URI of the grid's login page.
*/

//
// Example of osGetGridLoginUri()
// Returns the value of loginuri = "http://GRIDDOMAINorIP:8002" in OpenSim.ini under [GridInfo] section.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the URI of the grid's login page using osGetGridLoginURI().
        string login_uri = osGetGridLoginURI();

        // Display the URI of the grid's login page.
        llSay(0, "Grid Login Uri = " + login_uri);
    }
}
