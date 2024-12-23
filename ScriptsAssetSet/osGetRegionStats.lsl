/*
list osGetRegionStats()
When this script is executed, it sets a timer event to trigger the timer event every 5 seconds. Within the timer event, 
the script retrieves various statistics about the region using osGetRegionStats, constructs a string with these statistics, 
and then displays the string as text above the object using llSetText. 
The displayed statistics include simulation FPS, physics FPS, time dilation, number of root agents, number of child agents, 
total prims in the region, active scripts, and script LPS (scripts executed per second).
*/

// llGetRegionStats() example script

default
{
    state_entry()
    {
        // Set a timer event to update the statistics every 5 seconds
        llSetTimerEvent(5.0);
    }
 
    timer()
    {
        // Retrieve region statistics
        list stats = osGetRegionStats();
        
        // Construct a string with the retrieved statistics
        string s = "Sim FPS: " + (string)llList2Float(stats, STATS_SIM_FPS) + "\n";
        s += "Physics FPS: " + (string)llList2Float(stats, STATS_PHYSICS_FPS) + "\n";
        s += "Time Dilation: " + (string)llList2Float(stats, STATS_TIME_DILATION) + "\n";
        s += "Root Agents: " + (string)llList2Integer(stats, STATS_ROOT_AGENTS) + "\n";
        s += "Child Agents: " + (string)llList2Integer(stats, STATS_CHILD_AGENTS) + "\n";
        s += "Total Prims: " + (string)llList2Integer(stats, STATS_TOTAL_PRIMS) + "\n";
        s += "Active Scripts: " + (string)llList2Integer(stats, STATS_ACTIVE_SCRIPTS) + "\n";
        s += "Script LPS: " + (string)llList2Float(stats, STATS_SCRIPT_LPS);
        
        // Display the statistics as text above the object
        llSetText(s, <0.0, 1.0, 0.0>, 1.0);
    }
}
