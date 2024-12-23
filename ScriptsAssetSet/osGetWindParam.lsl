/*
float osGetWindParam(string plugin, string param)
This script retrieves and displays information about the active wind model plugin in an OpenSim environment when an object is touched. 
It distinguishes between the "SimpleRandomWind" and "ConfigurableWind" plugins and displays relevant wind parameters accordingly.
*/

// osGetWindParam() sample
// Touch this object to see the current wind parameters
 
default
{
    // Event handler for touch start
    touch_start(integer number)
    {
        // Retrieve the name of the active wind model plugin
        string activePluginName = osWindActiveModelPluginName();
 
        // Check if the active wind model plugin is "SimpleRandomWind"
        if(activePluginName == "SimpleRandomWind")
        {
            // Display information about SimpleRandomWind
            llSay(0, "[SimpleRandomWind]");
            
            // Retrieve and display the strength of the wind
            float strength = osGetWindParam("SimpleRandomWind", "strength");
            llSay(0, "wind strength(strength) = " + (string)strength);
        }
        // Check if the active wind model plugin is "ConfigurableWind"
        else if(activePluginName == "ConfigurableWind")
        {
            // Display information about ConfigurableWind
            llSay(0, "[ConfigurableWind]");
            
            // Retrieve and display the average wind strength
            float avgStrength = osGetWindParam("ConfigurableWind", "avgStrength");
            llSay(0, "average wind strength(avg_strength) = " + (string)avgStrength);
            
            // Retrieve and display the average wind direction in degrees
            float avgDirection = osGetWindParam("ConfigurableWind", "avgDirection");
            llSay(0, "average wind direction in degrees(avg_direction) = " + (string)avgDirection);
            
            // Retrieve and display the allowable variance in wind strength
            float varStrength = osGetWindParam("ConfigurableWind", "varStrength");
            llSay(0, "allowable variance in wind strength(var_strength) = " + (string)varStrength);
            
            // Retrieve and display the allowable variance in wind direction in +/- degrees
            float varDirection = osGetWindParam("ConfigurableWind", "varDirection");
            llSay(0, "allowable variance in wind direction in +/- degrees(var_direction) = " + (string)varDirection);
            
            // Retrieve and display the rate of change of wind parameters
            float rateChange = osGetWindParam("ConfigurableWind", "rateChange");
            llSay(0, "rate of change(rate_change) = " + (string)rateChange);
        }            
    }
}
