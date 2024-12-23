/*
osClearInertia()
In this example, an object with inertia is first created using the osSetInertia() function. Then, the inertia of the object is cleared using osClearInertia(). 
A confirmation message is sent in local chat to indicate that the object's inertia has been cleared.

Please note that appropriate permissions to modify the object's inertia are required for this example, and the script needs to be run in a region that supports the use of ubOde.
*/

// Example of osClearInertia
 
default
{
    state_entry()
    {
        // Create object with inertia
        osSetInertia(<0.1, 0.1, 0.1>, <0.0, 0.0, 0.0>, <0.1, 0.1, 0.1>, <0.0, 0.0, 0.0>);
        
        // Clear inertia
        osClearInertia();
        
        // Send confirmation message in local chat
        llOwnerSay("The object's inertia has been cleared.");
    }
}
