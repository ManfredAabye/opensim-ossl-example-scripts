/*
osLocalTeleportAgent(key agentID, vector newPosition, vector newVelocity, vector newLookat, integer optionFlags)
LandingPoint: This vector specifies the X, Y, Z coordinates where the avatar will arrive after teleportation.
TPvel: This vector specifies the velocity at which the avatar arrives after teleportation. In this case, it's set to <0, 0, 0>, indicating no velocity.
LookAt: This vector specifies the direction the avatar should face upon arrival. In this example, it's set to <1, 1, 0>, which could mean looking diagonally towards the positive X and Y axes.
state_entry(): This event handler is triggered when the script initializes. It displays a whisper message indicating that OS Local Teleport is active.
touch_start(integer num_detected): This event handler is triggered when an avatar touches the object containing the script. 
It retrieves the key of the avatar touching the object, sends an instant message to the avatar indicating the teleport destination, 
and performs local teleportation of the avatar to the specified LandingPoint with the specified parameters (TPvel, LookAt). 
The OS_LTPAG_USELOOKAT and OS_LTPAG_FORCEFLY flags indicate that the specified LookAt direction should be used and that the avatar should fly to the LandingPoint.
*/

// osLocalTeleportAgent Script Example
 
vector LandingPoint = <128, 128, 50>; // X,Y,Z landing point for avatar to arrive at
vector TPvel = <0, 0, 0>; // Velocity at which the avatar arrives
vector LookAt = <1, 1, 0>; // Direction for the avatar to look at when arriving

default
{
    state_entry()
    {
        // Display a whisper message indicating that OS Local Teleport is active
        llWhisper(0, "OS Local Teleport Active");
    }

    touch_start(integer num_detected)
    {
        // Get the key of the avatar touching the object
        key avatar = llDetectedKey(0);

        // Send an instant message to the avatar indicating the teleport destination
        llInstantMessage(avatar, "Teleporting you to: " + (string)LandingPoint);

        // Perform local teleportation of the avatar to the specified LandingPoint with specified parameters
        osLocalTeleportAgent(avatar, LandingPoint, TPvel, LookAt, OS_LTPAG_USELOOKAT | OS_LTPAG_FORCEFLY);
    }
}
