/*
osSetWindParam(string plugin, string param, float value)
    float newStrength = 30.0;: Declares a variable to hold the new wind strength value.
    float newAvgStrength = 15.0;, float newAvgDirection = 10.0;, float newVarStrength = 7.0;, float newVarDirection = -30.0;, float newRateChange = 8.0;: Declare variables to hold new values for various wind parameters.
    touch_start(integer number): Event handler triggered when the object associated with the script is touched.
    string activePluginName = osWindActiveModelPluginName();: Retrieves the name of the active wind model plugin.
    if(activePluginName == "SimpleRandomWind"): Checks if the active wind model is "SimpleRandomWind". If true, it sets the new wind strength parameter for this model.
    else if(activePluginName == "ConfigurableWind"): Checks if the active wind model is "ConfigurableWind". If true, it sets new values for various wind parameters such as average strength, average direction, variance in strength, variance in direction, and rate of change.

In summary, this script allows users to adjust wind parameters in an OpenSim environment based on the currently active wind model. It provides feedback messages indicating the changes made to the wind parameters.
*/

// osSetWindParam() sample
// Touch this object to change the current wind parameters
// Run osGetWindParam() sample to check if these values are applied
 
float newStrength = 30.0;
float newAvgStrength = 15.0;
float newAvgDirection = 10.0;
float newVarStrength = 7.0;
float newVarDirection = -30.0;
float newRateChange = 8.0;

default
{
    touch_start(integer number)
    {
        string activePluginName = osWindActiveModelPluginName(); // Get the name of the active wind model plugin

        // Check if the active wind model is SimpleRandomWind
        if(activePluginName == "SimpleRandomWind")
        {
            llSay(0, "[SimpleRandomWind]"); // Output the active wind model name
            osSetWindParam("SimpleRandomWind", "strength", newStrength); // Set wind strength parameter
            llSay(0, "wind strength(strength) is changed to " + (string)newStrength); // Output the change
        }
        // Check if the active wind model is ConfigurableWind
        else if(activePluginName == "ConfigurableWind")
        {
            llSay(0, "[ConfigurableWind]"); // Output the active wind model name
            // Set various parameters for ConfigurableWind model
            osSetWindParam("ConfigurableWind", "avgStrength", newAvgStrength);
            llSay(0, "average wind strength(avg_strength) is changed to " + (string)newAvgStrength);
            osSetWindParam("ConfigurableWind", "avgDirection", newAvgDirection);
            llSay(0, "average wind direction in degrees(avg_direction) is changed to " + (string)newAvgDirection);
            osSetWindParam("ConfigurableWind", "varStrength", newVarStrength);
            llSay(0, "allowable variance in wind strength(var_strength) is changed to " + (string)newVarStrength);
            osSetWindParam("ConfigurableWind", "varDirection", newVarDirection);
            llSay(0, "allowable variance in wind direction in +/- degrees(var_direction) is changed to " + (string)newVarDirection);
            osSetWindParam("ConfigurableWind", "rateChange", newRateChange);
            llSay(0, "rate of change(rate_change) is changed to " + (string)newRateChange);
        }            
    }
}
