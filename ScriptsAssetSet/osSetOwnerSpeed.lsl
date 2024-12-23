/*
osSetOwnerSpeed(float SpeedModifier)
    In the state_entry() event, the script calls the osSetOwnerSpeed() function to set the movement speed for the owner of the object to 2.0 meters per second.
    This function restricts the movement speed of the owner in the virtual environment.
*/

//
// osSetOwnerSpeed Script Example
//
 
default
{
    state_entry()
    {
        // Set the movement speed for the owner to 2.0 meters per second
        osSetOwnerSpeed(2.0);
    }
}
