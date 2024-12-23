/*
osSetParcelMediaURL(string url)
    In the state_entry() event, a message is displayed on the public channel indicating to touch the object to see how osSetParcelMediaURL works.
    In the touch_start event, the script displays the media URL being set to the parcel on the public channel.
    It then calls the osSetParcelMediaURL function with the specified URL to set the media content for the parcel. In this case, it sets a video stream from the provided URL to the parcel for display.
*/


//Example osSetParcelMediaURL
 
string sURL = "http://www.archive.org/download/CncdVsFairlightCeasefire/ceasefire_all_fall_down.stream.mp4"; // The URL we are setting to the parcel.

default
{
    state_entry()
    {
        // Display a message indicating to touch the object to see how osSetParcelMediaURL works
        llSay(PUBLIC_CHANNEL, "Touch to see how osSetParcelMediaURL works");
    }

    touch_start(integer num)
    {
        // Display the media URL being set to the parcel
        llSay(PUBLIC_CHANNEL, "Media URL being set to: " + sURL);
        
        // Set the media URL for the parcel using osSetParcelMediaURL
        osSetParcelMediaURL(sURL);
    }
}
