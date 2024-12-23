/*
vector osGetSitTargetPos()
    The script begins with the default event handler, which is the default state for the script.
    Inside the state_entry() event handler, it initializes two vector variables write_pos and write_rot with specific values.
    It then uses llSitTarget() function to set the sit target position and rotation for the object using the values of write_pos and write_rot. 
    The llEuler2Rot() function is used to convert Euler angles to a rotation quaternion, and DEG_TO_RAD is a constant used for converting degrees to radians.
    Next, it retrieves the sit target position using osGetSitTargetPos() and stores it in the read_pos vector variable.
    It also retrieves the sit target rotation using osGetSitTargetRot(), converts it from a rotation quaternion to Euler angles using llRot2Euler(), 
    and then converts the result from radians to degrees using RAD_TO_DEG. The resulting Euler angles are stored in the read_rot vector variable.
    Finally, it uses llOwnerSay() to output the sit target position and rotation to the owner of the object.

Overall, this script demonstrates how to set and retrieve sit target position and rotation for an object in OpenSim, as well as how to convert between different angle representations.
*/


default
{
    state_entry()
    {
        // Define a vector variable named write_pos with values <1,2,3>
        vector write_pos = <1,2,3>;
        
        // Define a vector variable named write_rot with values <4,5,6>
        vector write_rot = <4,5,6>;

        // Set the sit target position and rotation for the object
        llSitTarget(write_pos, llEuler2Rot(write_rot * DEG_TO_RAD));

        // Get the sit target position of the object
        vector read_pos = osGetSitTargetPos();
        
        // Get the sit target rotation of the object and convert it to degrees
        vector read_rot = llRot2Euler(osGetSitTargetRot()) * RAD_TO_DEG;

        // Output the sit target position to the owner of the object
        llOwnerSay(read_pos);
        
        // Output the sit target rotation to the owner of the object
        llOwnerSay(read_rot);
    }
}
