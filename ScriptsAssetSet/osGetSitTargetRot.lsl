/*
rotation osGetSitTargetRot()
    In this example, the script sets the sit target position to <0, 0, 0> (center of the object) and the sit target rotation to 90 degrees around the Y-axis.
    The osGetSitTargetRot() function retrieves the sit target rotation of the object.
    The retrieved rotation is then converted from a rotation quaternion to Euler angles using llRot2Euler() and stored in the euler_rot vector variable.
    Finally, the sit target rotation is outputted to the owner of the object using llOwnerSay().

When you run this script in OpenSim, it will output the sit target rotation to the object owner in the form of Euler angles.
*/


default
{
    state_entry()
    {
        // Set the sit target position and rotation for the object
        vector sit_pos = <0, 0, 0>;
        rotation sit_rot = llEuler2Rot(<0, 90, 0> * DEG_TO_RAD);
        llSitTarget(sit_pos, sit_rot);

        // Get the sit target rotation of the object
        rotation read_rot = osGetSitTargetRot();

        // Output the sit target rotation to the owner of the object
        vector euler_rot = llRot2Euler(read_rot) * RAD_TO_DEG;
        llOwnerSay("Sit Target Rotation: " + (string)euler_rot);
    }
}
