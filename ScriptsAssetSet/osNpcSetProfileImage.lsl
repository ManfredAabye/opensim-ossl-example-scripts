/*
osNpcSetProfileImage(key npc, string image)
touch_start(integer number): This event is triggered when an object is touched by an avatar. If the 'npc' variable is not set (i.e., no NPC exists), 
it saves the owner's appearance to a notecard named "MyClone" and sets a timer event. If an NPC already exists, it removes the NPC, resets the 'npc' variable, 
and removes the notecard "MyClone" from the inventory.

timer(): This event is triggered when the timer set in touch_start() elapses (after 2 seconds). 
It resets the timer event, creates an NPC named "John Smith" 2 meters above the touch point, and sets the NPC's profile image to the value of 'image'.

Overall, this script creates a clone NPC named "John Smith" with a specified profile image when an object is touched. 
If the object is touched again while the NPC exists, it removes the NPC and associated notecard from the inventory.
*/

// osNpcSetProfileImage Example
// Author: djphil
 
key npc = NULL_KEY; // Declares a key variable named 'npc' and initializes it with NULL_KEY.
string image = "My Photo"; // Declares a string variable named 'image' and initializes it with a value.

default
{
    touch_start(integer number)
    {
        if (npc == NULL_KEY) // Checks if 'npc' is not already set.
        {
            osOwnerSaveAppearance("MyClone"); // Saves the owner's appearance to a notecard named "MyClone".
            llSetTimerEvent(2.0); // Sets a timer event to 2 seconds.
        }
        else
        {
            osNpcRemove(npc); // Removes the NPC.
            npc = NULL_KEY; // Resets 'npc' to NULL_KEY.
            llRemoveInventory("MyClone"); // Removes the notecard "MyClone" from the inventory.
        }
    }

    timer()
    {
        llSetTimerEvent(0.0); // Resets the timer event.
        npc = osNpcCreate("John", "Smith", llGetPos() + <0.0, 0.0, 2.0>, "MyClone"); // Creates an NPC named "John Smith" 2 meters above the touch point.
        osNpcSetProfileImage(npc, image); // Sets the NPC's profile image to the value of 'image'.
    }
}
