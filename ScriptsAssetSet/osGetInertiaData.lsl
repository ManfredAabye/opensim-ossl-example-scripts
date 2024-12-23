/*
list osGetInertiaData()
Returns a list:
[
    float mass, // the total mass of the linkset
    vector center, // the center of mass offset relative to root prim
    vector Idiag, // diagonal elements of inertia
    vector Ioffdiag // off-diagonal elements of inertia
]

The mass may be -1 if inertia data is invalid or not available.

Caution! Only supported by ubOde for now.
*/

//
// osGetInertiaData Script Example
// Author: djphil
//

default
{
    state_entry()
    {
        // Display a message prompting to touch the object to see osGetInertiaData usage.
        llSay(PUBLIC_CHANNEL, "Touch to see osGetInertiaData usage.");

        // Enable physics for the object.
        llSetStatus(STATUS_PHYSICS, TRUE);
    }

    touch_start(integer number)
    {
        // Retrieve the inertia data of the object's linkset using osGetInertiaData().
        list buffer = osGetInertiaData();

        // Extract data from the buffer.
        float mass = llList2Float(buffer, 0);
        vector center = llList2Vector(buffer, 1);
        vector Idiag = llList2Vector(buffer, 2);
        vector Ioffdiag = llList2Vector(buffer, 3);

        // Check if the inertia data is valid.
        if (mass == -1)
        {
            // Display a message indicating that the inertia data is invalid or not available.
            llSay(PUBLIC_CHANNEL, "The inertia data is invalid or not available ...");
        }
        else
        {
            // Display the inertia data.
            string text;
            text += "\n• The total mass of the linkset is " + (string)mass;
            text += "\n• The center of mass offset relative to root prim is " + (string)center;
            text += "\n• Diagonal elements of inertia are " + (string)Idiag;
            text += "\n• Off-diagonal elements of inertia are " + (string)Ioffdiag;
            llSay(PUBLIC_CHANNEL, text);
        }
    }
}
