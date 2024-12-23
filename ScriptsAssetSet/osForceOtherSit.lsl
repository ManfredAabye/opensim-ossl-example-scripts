/*
osForceOtherSit(key avatar)
This function forces another avatar to sit on the object containing the script.
*/

// Simple example for osForceOtherSit

default
{
    // The state entry event is triggered when the script begins running.
    state_entry()
    {
        // Set the sit target for the object.
        llSitTarget(<0.0, 0.0, 1.0>, ZERO_ROTATION); // The vector's components must not all be set to 0 for effect to take place.
    }

    // The touch_start event is triggered when an object is touched by an avatar.
    touch_start(integer num)
    {
        // Force the avatar who touched the object to sit on it.
        osForceOtherSit(llDetectedKey(0));
    }
}
