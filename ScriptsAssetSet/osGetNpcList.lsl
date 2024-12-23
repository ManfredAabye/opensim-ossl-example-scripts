/*
    osGetNPCList is a function that retrieves a list of non-player characters (NPCs) in the simulator.
    It returns a list containing the UUIDs (Unique User Identifiers) of all NPCs present.

    This script demonstrates the usage of osGetNPCList by displaying the UUIDs of NPCs when touched.
*/

//
// osGetNPCList Script Example
// Author: djphil
//

// The default state is the initial state of the script.
default
{
    // The state_entry event is triggered when the script is initialized or reset.
    state_entry()
    {
        // Say a message in the public chat channel when the script initializes.
        llSay(PUBLIC_CHANNEL, "Touch to see osGetNPCList usage.");
    }

    // The touch_start event is triggered when an object is touched.
    touch_start(integer number)
    {
        // Retrieve the list of NPCs using osGetNPCList function.
        list npcs = osGetNPCList();

        // Check if the list of NPCs is empty.
        if (npcs == [])
        {
            // If there are no NPCs, say a message indicating their absence.
            llSay(PUBLIC_CHANNEL, "There are no NPCs in this sim currently.");
        }
        else
        {
            // If NPCs are present, say a message listing their UUIDs.
            llSay(PUBLIC_CHANNEL, "NPCs in this sim (without avatars): " + llList2CSV(npcs));
        }
    }
}
