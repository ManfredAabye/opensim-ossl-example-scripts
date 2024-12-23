/*
list osGetLinkPrimitiveParams(integer linknumber, list rules)
This function retrieves primitive parameters for the specified link number according to the given rules.

Caution: This function is only supported by ubOde for now.

Threat Level: This function does not do a threat level check.
Permissions: Use of this function is always allowed by default.
Delay: 0 seconds
*/

// llGetLinkPrimitiveParams() example script

default
{
    state_entry()
    {
        // Initialize variables
        vector average = ZERO_VECTOR;
        
        // Retrieve primitive parameters (PRIM_SIZE) for the entire linkset
        list params = osGetLinkPrimitiveParams(LINK_SET, [PRIM_SIZE]);
        
        // Calculate the average size of prims in the linkset
        integer len = llGetListLength(params);
        integer i;
        for (i = 0; i < len; i++)
            average += llList2Vector(params, i);
        average /= (float)len;
        
        // Display the average size
        llOwnerSay("The average size of the prims in this linkset is " + (string)average);
    }
}
