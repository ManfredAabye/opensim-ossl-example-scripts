/*
osParcelJoin(vector pos1, vector pos2)
    state_entry(): This is an event handler that is called automatically when the script is initialized or reset. In this case, it sends a message to channel 0 indicating that touching will join adjacent parcels.

    touch_start(integer num_detected): This event is triggered when an object is touched by an avatar. In this script, it defines the coordinates of the top corner (start) and the bottom corner (end) of the parcel to be joined, and then calls the osParcelJoin function to join the adjacent parcels within the specified region.

    vector start = <0.0, 0.0, 0.0>;: This line defines the coordinates of the top corner of the parcel to be joined. In this example, it's set to <0.0, 0.0, 0.0>.

    vector end = <100.0, 100.0, 0.0>;: This line defines the coordinates of the bottom corner of the parcel to be joined. In this example, it's set to <100.0, 100.0, 0.0>.

    osParcelJoin(start, end);: This line calls the osParcelJoin function with the specified start and end vectors, which instructs the script to join the adjacent parcels within the region defined by these vectors.

Overall, this script allows users to join adjacent parcels by touching an object with this script inside Second Life. However, 
please note that this script utilizes OpenSim-specific functions (osParcelJoin) and may not work in other virtual world platforms or grids. Additionally, 
it's important to have the appropriate permissions and authority to join parcels in the region.
*/

default
{
    state_entry()
    {
        llSay(0, "Touch to Join adjacent Parcels"); // Sends a message to channel 0 indicating the purpose of the touch.
    }

    touch_start(integer num_detected)
    {
        vector start = <0.0, 0.0, 0.0>; // Defines the coordinates of the top corner of the parcel to be joined.
        vector end = <100.0, 100.0, 0.0>; // Defines the coordinates of the bottom corner of the parcel to be joined.
        osParcelJoin(start, end); // Calls the osParcelJoin function to join the adjacent parcels within the specified region.
    }
}
