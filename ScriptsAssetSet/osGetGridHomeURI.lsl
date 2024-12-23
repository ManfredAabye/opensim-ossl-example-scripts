/*
string osGetGridHomeURI()
This function retrieves the URI of the grid's home page.
*/

//
// Example of osGetGridHomeUri()
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the URI of the grid's home page using osGetGridHomeURI().
        string home_uri = osGetGridHomeURI();

        // Display the URI of the grid's home page.
        llSay(0, "Grid Home Uri = " + home_uri);
    }
}
