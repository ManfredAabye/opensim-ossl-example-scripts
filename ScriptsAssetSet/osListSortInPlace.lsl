/*
osListSortInPlace(list src, integer stride, integer ascending)
This script, when placed inside an object in an OpenSim region, will execute state_entry() when the object is initialized. 
Inside this function, it demonstrates the usage of the osListSortInPlace() function to sort lists in ascending order with different strides. 
It outputs the original list, sorts it, and then outputs the sorted list for each demonstration.
*/

// Example of osListSortInPlace()


default
{
    state_entry()
    {
        // Say a message indicating the purpose of this script.
        llSay(0, "osListSortInPlace example");

        // Define an unsorted list with mixed data types.
        list src = [1, "D", -4, "A", "B"];

        // Say the original list before sorting.
        llSay(0, "original list: " + llDumpList2String(src, ","));

        // Sort the list in ascending order with a stride of 1 and replace the original list with the sorted one.
        osListSortInPlace(src, 1, TRUE);

        // Say the sorted list.
        llSay(0, "sorted in ascending order with stride 1: " + llDumpList2String(src, ","));

        // Change the list to include additional elements for the next sorting demonstration.
        src = [1, "D", -4, "A", 0, "B"];

        // Say the original list before sorting.
        llSay(0, "original list: " + llDumpList2String(src, ","));

        // Sort the list in ascending order with a stride of 2 and replace the original list with the sorted one.
        osListSortInPlace(src, 2, 1);

        // Say the sorted list.
        llSay(0, "sorted in ascending order with stride 2: " + llDumpList2String(src, ","));
    }
}
