/*
string osGetGridCustom(string key)
This function retrieves the value associated with the specified key from the grid's custom configuration.
*/

//
// Example of osGetGridCustom(string key)
// Returns the grid's value of the sent key ...
//
// For grids and standalones, the [GridInfoService]
// defines key/value pairs for clients. In grids,
// this is found in your Robust[.HG].ini and for
// standalones, this is found in the file -
// ./bin/config-include/StandaloneCommon.ini
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Retrieve the value associated with the key "welcome" from the grid's custom configuration using osGetGridCustom().
        // This example demonstrates retrieving the welcome page URL configured for the grid.
        string welcome_page = osGetGridCustom("welcome");

        // Display the value associated with the key "welcome" (the grid's welcome page URL).
        llSay(0, "Grid Welcome Page = " + welcome_page);
    }
}
