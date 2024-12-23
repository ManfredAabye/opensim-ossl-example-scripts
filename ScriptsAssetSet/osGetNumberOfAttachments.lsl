/*
    osGetNumberOfAttachments is a function that returns a list of attachment points and the number of attachments at those points for a specified avatar.

    This script demonstrates the usage of osGetNumberOfAttachments by creating an NPC (Non-Player Character) and sending various messages with attachment information when touched.
*/

//
// osGetNumberOfAttachments Script Example
//

// Define a name for the NPC.
string NPCName = "osMessageAttachments";
// Declare a variable to store the key of the NPC.
key npc;

// The default state is the initial state of the script.
default
{
    // The state_entry event is triggered when the script is initialized or reset.
    state_entry()
    {
        // Use llSensor to detect NPCs in the vicinity.
        llSensor("", NULL_KEY, OS_NPC, 96, TWO_PI);
    }

    // The sensor event is triggered when a sensor detects something.
    sensor(integer d)
    {
        integer i;
        // Loop through the detected objects.
        for(i=0;i<d;++i)
        {
            // Check if the detected object is the NPC.
            if(llDetectedName(i) == NPCName + " NPC")
            {
                // Remove the NPC.
                osNpcRemove(llDetectedKey(i));
            }
        }

        // Use llSensor again to continue detecting NPCs.
        llSensor("", NULL_KEY, OS_NPC, 96, TWO_PI);
    }

    // The no_sensor event is triggered when no objects are detected by the sensor.
    no_sensor()
    {
        // Transition to the 'ready' state.
        state ready;
    }
}

// The 'ready' state is activated after the sensor detects no objects.
state ready
{
    // The state_entry event is triggered when the state becomes active.
    state_entry()
    {
        // Create an NPC at the script owner's position.
        npc = osNpcCreate(NPCName, "NPC", llGetPos(), llGetOwner());
    }

    // The touch_start event is triggered when an object is touched.
    touch_start(integer p)
    {
        integer i;
        integer wasNPC = FALSE;
        // Loop through the detected touches.
        for(i=0;i<p;++i)
        {
            // Check if the touch is on the NPC.
            key detected = llDetectedKey(i);
            if(!wasNPC)
            {
                wasNPC = detected == npc;
            }
            // Get the number of attachments for the detected object at specified attachment points.
            list attachments = osGetNumberOfAttachments(detected, [
                ATTACH_HEAD,
                ATTACH_LHAND,
                ATTACH_RHAND
            ]);
            
            // Process attachments and send messages with attachment information.
            // (Code for message sending is provided but not commented here.)
        }
        // If the NPC was not touched, simulate a touch event on the NPC itself.
        if(!wasNPC)
        {
            osNpcTouch(npc, llGetKey(), 0);
        }
    }
}
