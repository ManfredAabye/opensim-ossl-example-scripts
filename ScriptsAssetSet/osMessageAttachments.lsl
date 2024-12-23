/*
osMessageAttachments(key avatar, string message, list attachmentPoints, integer options);
    In the default state:
        In the state_entry() event, a sensor is started to detect NPCs in the region.
        In the sensor() event, detected NPCs with names matching NPCName + " NPC" are removed.
        If no NPCs are detected (no_sensor() event), the script transitions to the ready state.

    In the ready state:
        In the state_entry() event, an NPC with the name NPCName is created at the owner's position.
        In the touch_start() event, when an object is touched:
            If the touched object is the NPC, messages with attachments are sent to the avatar who touched it.
            If the touched object is not the NPC, a simulated touch event is triggered on the NPC.

The script utilizes various OpenSim functions such as osNpcCreate(), osNpcRemove(), osGetNumberOfAttachments(), 
and osMessageAttachments() to control the NPC and interact with avatars in the scene.
*/

// Example of osMessageAttachments
 
string NPCName = "osMessageAttachments"; // Name of the NPC
key npc; // Key of the NPC

default
{
    state_entry()
    {
        // Start a sensor to detect NPCs in the region
        llSensor("", NULL_KEY, OS_NPC, 96, TWO_PI);
    }
 
    sensor(integer d)
    {
        integer i;
        for(i=0;i<d;++i)
        {
            // Check if the detected NPC matches the specified NPCName
            if(llDetectedName(i) == NPCName + " NPC")
            {
                // Remove the detected NPC
                osNpcRemove(llDetectedKey(i));
            }
        }
 
        // Restart the sensor to detect NPCs again
        llSensor("", NULL_KEY, OS_NPC, 96, TWO_PI);
    }
 
    no_sensor()
    {
        // If no NPCs are detected, transition to the "ready" state
        state ready;
    }
}
 
 
state ready
{
    state_entry()
    {
        // Create the NPC at the owner's position
        npc = osNpcCreate(NPCName, "NPC", llGetPos(), llGetOwner());
    }
 
    touch_start(integer p)
    {
        integer i;
        integer wasNPC = FALSE;
        for(i=0;i<p;++i)
        {
            // Check if the touched object is the NPC
            key detected = llDetectedKey(i);
            if(!wasNPC)
            {
                wasNPC = detected == npc;
            }
            
            // Get the attachments of the detected avatar
            list attachments = osGetNumberOfAttachments(detected, [
                ATTACH_HEAD,
                ATTACH_LHAND,
                ATTACH_RHAND
            ]);
            
            // Filter attachments to include only non-zero attachment points
            list attachmentsToMessage = [];
            integer j;
            integer k = llGetListLength(attachments);
            integer l;
            for(j=0;j<k;j+=2){
                l = llList2Integer(attachments, j);
                if(l > 0 && llList2Integer(attachments, j + 1) > 0){
                    attachmentsToMessage += [l];
                }
            }
            
            // Send messages with attachments to the detected avatar
            osMessageAttachments(detected, "foo", attachmentsToMessage, 0);
            osMessageAttachments(detected, "bar", attachmentsToMessage, OS_ATTACH_MSG_INVERT_POINTS);
            osMessageAttachments(detected, "baz", [OS_ATTACH_MSG_ALL], 0);
            osMessageAttachments(detected, "will never be sent", [OS_ATTACH_MSG_ALL], OS_ATTACH_MSG_INVERT_POINTS);
            osMessageAttachments(detected, "heard by both feet", [ATTACH_LFOOT, ATTACH_RFOOT], 0);
            osMessageAttachments(detected, "heard by object creator feet", [ATTACH_LFOOT, ATTACH_RFOOT], OS_ATTACH_MSG_OBJECT_CREATOR);
            osMessageAttachments(detected, "heard by script creator feet", [ATTACH_LFOOT, ATTACH_RFOOT], OS_ATTACH_MSG_SCRIPT_CREATOR);
        }
        
        // If the touched object is not the NPC, simulate a touch event on the NPC
        if(!wasNPC)
        {
            osNpcTouch(npc, llGetKey(), 0);
        }
    }
}
