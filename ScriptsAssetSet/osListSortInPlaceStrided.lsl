/* osListSortInPlaceStrided(list src, integer stride, integer stride_index, integer ascending)
This script, when placed inside an object in an OpenSim region, will execute state_entry() when the object is initialized. 
Inside this function, it demonstrates the usage of the osListSortInPlaceStrided() function to sort lists in ascending order with different strides and starting indices. 
It outputs the original list, sorts it, and then outputs the sorted list for each demonstration.
*/

// This OpenSim Script Language (OSL) script demonstrates the usage of osListSortInPlaceStrided function.

default
{
    state_entry()
    {
        // Say a message indicating the purpose of this script.
        llSay(0, "osListSortInPlaceStrided example");

        // Define an unsorted list with mixed data types.
        list src = [1, "D", -4, "A", 9, "B"];

        // Say the original list before sorting.
        llSay(0, "original list: " + llDumpList2String(src, ","));

        // Sort the list in ascending order with a stride of 2 and starting index 0, and replace the original list with the sorted one.
        osListSortInPlaceStrided(src, 2, 0, TRUE);

        // Say the sorted list.
        llSay(0, "sorted in ascending order with stride 2, index 0: " + llDumpList2String(src, ","));

        // Reset the list to its original unsorted state.
        src = [1, "D", -4, "A", 9, "B"];

        // Say the original list before sorting.
        llSay(0, "original list: " + llDumpList2String(src, ","));

        // Sort the list in ascending order with a stride of 2 and starting index 1, and replace the original list with the sorted one.
        osListSortInPlaceStrided(src, 2, 1, TRUE);

        // Say the sorted list.
        llSay(0, "sorted in ascending order with stride 2, index 1: " + llDumpList2String(src, ","));
    }
}

