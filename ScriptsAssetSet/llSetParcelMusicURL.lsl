/*
This script sets the music URL for the parcel to "http://www.archive.org/download/Torley_Wong_-_The_Final_Selection/Torley_Wong-Lovers__Dance.mp3" when it is initialized or reset.
*/

// This script sets the music URL for the parcel when it is initialized or reset.

// Default state of the script
default
{
    // Event handler triggered when the script is initialized or reset
    state_entry()
    {
        // Set the music URL for the parcel
        llSetParcelMusicURL("http://www.archive.org/download/Torley_Wong_-_The_Final_Selection/Torley_Wong-Lovers__Dance.mp3");
    }
}

