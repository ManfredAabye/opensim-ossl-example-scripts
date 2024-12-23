/*
string osGetGridGatekeeperURI()
This function retrieves the URI of the grid's gatekeeper service.
*/

//
// Example of osGetGridGatekeeperUri()
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the URI of the grid's gatekeeper service using osGetGridGatekeeperURI().
        string gatekeeper_uri = osGetGridGatekeeperURI();

        // Display the URI of the grid's gatekeeper service.
        llSay(0, "Grid Gatekeeper Uri = " + gatekeeper_uri);
    }
}
