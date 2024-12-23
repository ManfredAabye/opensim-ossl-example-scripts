/*
osSetPrimitiveParams(key prim, list rules)
This script defines two states ('default' and 'alpha') and transitions between them based on touch events. 
In the 'default' state, the primitive is hidden when touched, and in the 'alpha' state, it becomes visible again when touched. 
The default color of the primitive is stored and reused when setting its parameters.
*/

// Example osSetPrimitiveParams


// Define the UUID of the target primitive
string target_uuid = "69031c69-36a5-4031-bdc8-8ca8c37f8eda";

// Declare a vector variable to store the default color of the primitive
vector default_color;

// Default state
default
{
    // Event handler called when the script enters the default state
    state_entry()
    {
        // Retrieve the primitive parameters of the target primitive (e.g., color)
        list prim_params = osGetPrimitiveParams(target_uuid, [PRIM_COLOR, ALL_SIDES]);
        // Extract the color from the parameters and store it in default_color
        default_color = llList2Vector(prim_params, 0);
    }     

    // Event handler called when the primitive is touched
    touch_start(integer number)
    {
        // Define the rules for the primitive (e.g., name, color, visibility)
        list rules = [PRIM_NAME, "HIDDEN", PRIM_COLOR, ALL_SIDES, default_color, 0.0];
        // Set the primitive parameters based on the defined rules
        osSetPrimitiveParams(target_uuid, rules);
        // Transition to the 'alpha' state
        state alpha;
    }
}

// Alpha state
state alpha
{
    // Event handler called when the primitive is touched in the alpha state
    touch_start(integer number)
    {
        // Define the rules for the primitive (e.g., name, color, visibility)
        list rules = [PRIM_NAME, "VISIBLE", PRIM_COLOR, ALL_SIDES, default_color, 1.0];
        // Set the primitive parameters based on the defined rules
        osSetPrimitiveParams(target_uuid, rules);
        // Transition back to the 'default' state
        state default;
    }
}
