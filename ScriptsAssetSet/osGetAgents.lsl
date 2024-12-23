/*
list osGetAgents()
This function retrieves a list of keys representing all agents in the current region.
*/

//
// Example of osGetAgents.
//

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // This is a demo script, no action needed in the state_entry.
        // Can be used for any initialization if necessary.
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer total_number)
    {
        // Retrieve a list of keys representing all agents in the current region using osGetAgents().
        list agent_keys = osGetAgents();

        // Convert the list of agent keys to a comma-separated value (CSV) string for easy display.
        string agent_keys_csv = llList2CSV(agent_keys);

        // Display the list of agent keys as a comma-separated value string.
        llSay(0, "Agents in sim: " + agent_keys_csv);
    }
}
