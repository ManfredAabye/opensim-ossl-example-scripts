// This script is a simple OpenSim script that listens for touch events on the object it is attached to. 
// When the object is touched, it will say "Hello, Avatar!" on channel 0.

// Default state of the script
default
{
    // Event handler triggered when the object is touched
    touch_start(integer num_detected)
    {
        // Say "Hello, Avatar!" on channel 0
        llSay(0, "Hello, Avatar!");
    }
}
