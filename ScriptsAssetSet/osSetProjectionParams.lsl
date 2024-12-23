/*
osSetProjectionParams(integer projection, key texture, float fov, float focus, float ambiance)
osSetProjectionParams(integer linknumber, integer projection, key texture, float fov, float focus, float ambiance)
osSetProjectionParams(key prim, integer projection, key texture, float fov, float focus, float ambiance)
    The script initializes variables for field of view (fov), focus (focus), ambiance (ambiance), and texture (texture).
    The function check_values() checks if the values of fov, focus, and ambiance are within valid ranges.
    In the state_entry() event handler, the script checks if the values are valid and displays them in the public chat channel. If the values are invalid, it notifies about it.
    The touch_start() event handler toggles the power state variable, sets primitive parameters for a point light based on the power state, and sets projection parameters using osSetProjectionParams() based on power, texture, fov, focus, and ambiance.

Overall, this script allows users to toggle a point light and set projection parameters based on the state of the power variable and the specified values for fov, focus, ambiance, and texture.
*/

// osSetProjectionParams Script Example
// Author: djphil

 
float fov = 1.5;        // Field of view, range 0.0 to 3.0
float focus = 15.0;     // Focus, range -20.0 to 20.0
float ambiance = 0.4;   // Ambiance, range 0.0 to 1.0

key texture = "00000000-0000-2222-3333-100000001001";  // Texture UUID

integer power;  // Power state variable

integer check_values()
{
    // Check if the values are within valid ranges
    if (fov < 0.0 || fov > 3.0) return FALSE;
    if (focus < -20.0 || focus > 20.0) return FALSE;
    if (ambiance < 0.0 || ambiance > 1.0) return FALSE;
    return TRUE;
}

default
{
    state_entry()
    {
        // Check if the values are within valid ranges
        if (check_values() == TRUE)
        {
            // If values are valid, display them in public chat channel
            llSay(PUBLIC_CHANNEL, "Touch to see osSetProjectionParams usage.");
            llSay(PUBLIC_CHANNEL, "fov: " + (string)fov);
            llSay(PUBLIC_CHANNEL, "focus: " + (string)focus);
            llSay(PUBLIC_CHANNEL, "ambiance: " + (string)ambiance);
            llSay(PUBLIC_CHANNEL, "texture: " + (string)texture);
        }
        else
        {
            // If values are invalid, notify in public chat channel
            llSay(PUBLIC_CHANNEL, "Invalid value(s) detected ...");
        }
    }

    // Event handler for touch_start event
    touch_start(integer number) 
    {
        // Toggle power state
        power = !power;

        // Set primitive parameters for point light based on power state
        osSetPrimitiveParams(llGetKey(),[PRIM_POINT_LIGHT, power, <1.0, 1.0, 1.0>, 1.0, 5.0, 0.5]);

        // Set projection parameters based on power state, texture, fov, focus, and ambiance
        osSetProjectionParams(power, texture, fov, focus, ambiance);
    }
}
