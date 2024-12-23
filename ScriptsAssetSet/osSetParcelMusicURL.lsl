/*
osSetParcelMusicURL(string url)
    In the state_entry() event, a message is displayed on the public channel indicating to touch the object to see how osSetParcelMusicURL works.
    In the touch_start event, the script displays the music URL being set to the parcel on the public channel.
    It then calls the osSetParcelMusicURL function with the specified URL to set the music content for the parcel. In this case, it sets an MP3 music file from the provided URL to the parcel for playback.
*/


//Example osSetParcelMusicURL
 
string sURL = "https://archive.org/download/CncdVsFairlightCeasefire/ceasefire_all_fall_down.320k.mp3"; // The URL we are setting to the parcel.

default
{
    state_entry()
    {
        // Display a message indicating to touch the object to see how osSetParcelMusicURL works
        llSay(PUBLIC_CHANNEL, "Touch to see how osSetParcelMusicURL works");
    }

    touch_start(integer num)
    {
        // Display the music URL being set to the parcel
        llSay(PUBLIC_CHANNEL, "Music URL being set to: " + sURL);
        
        // Set the music URL for the parcel using osSetParcelMusicURL
        osSetParcelMusicURL(sURL);
    }
}
