/*
This script listens for commands on channel 5 and performs various actions such as banning or allowing avatars on the land, based on the received commands.
*/

// Commands are:
// 5 ban:full_avatar_name
// 5 tempban:full_avatar_name
// 5 unban:full_avatar_name
// 5 pass:full_avatar_name
// 5 unpass:full_avatar_name
// 5 clearban
// 5 clearpass

// Declare a variable to store the command
string command;

// Default state of the script
default
{
    // Event handler triggered when the script is initialized or reset
    state_entry()
    {
        // Listen on channel 5 for messages from the object owner
        llListen(5, "", llGetOwner(), "");
    }
    
    // Event handler triggered when the object is rezzed
    on_rez(integer param)
    {
        // Reset the script
        llResetScript();
    }

    // Event handler triggered when a message is received on the listen channel
    listen(integer chan, string name, key id, string message)
    {
        // Check if a command is already being processed
        if (command != "")
        {
            llOwnerSay("Sorry, still processing last command, try again in a second.");
        }
        
        // Split the message into a list of arguments using ":" as delimiter
        list args = llParseString2List(message, [":"], []);
        // Extract the command from the message
        command = llToLower(llList2String(args, 0));
        
        // Check the command
        if (command == "clearban")
        {
            // Clear the land ban list
            llResetLandBanList();
        }
        if (command == "clearpass")
        {
            // Clear the land pass list
            llResetLandPassList();
        }
        else
        {
            // Use llSensor to detect avatars in range
            llSensor(llList2String(args, 1), NULL_KEY, AGENT, 96, PI);
        }
    }
    
    // Event handler triggered when llSensor doesn't detect any avatars
    no_sensor()
    {
        // Reset the command variable
        command = "";
    }
    
    // Event handler triggered when llSensor detects avatars
    sensor(integer num)
    {
        integer i;
        // Loop through the detected avatars
        for (i = 0; i < num; ++i)
        {
            // Check the command and perform corresponding actions
            if (command == "ban")
            {
                // Ban the detected avatar indefinitely
                llAddToLandBanList(llDetectedKey(i), 0.0);
            }
            if (command == "tempban")
            {
                // Temporarily ban the detected avatar for 1 hour
                llAddToLandBanList(llDetectedKey(i), 1.0);
            }
            if (command == "unban")
            {
                // Remove the ban for the detected avatar
                llRemoveFromLandBanList(llDetectedKey(i));
            }
            if (command == "pass")
            {
                // Add the detected avatar to the land pass list for 1 hour
                llAddToLandPassList(llDetectedKey(i), 1.0);
            }
            if (command == "unpass")
            {
                // Remove the detected avatar from the land pass list
                llRemoveFromLandPassList(llDetectedKey(i));
            }
        }
        // Reset the command variable
        command = "";
    }
}
