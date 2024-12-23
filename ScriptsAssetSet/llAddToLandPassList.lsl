/*
This script listens for commands on channel 5 and allows the owner to manage ban and pass lists for avatars in an OpenSim environment. 
The owner can issue commands like ban, tempban, unban, pass, unpass, clearban, and clearpass to control access to their land. 
The script processes these commands and applies the appropriate actions to the detected avatars or clears the ban/pass lists accordingly. 
Additionally, it handles cases where no avatars are detected and resets the command accordingly.
*/

//Commands are:
///5 ban:full_avatar_name
///5 tempban:full_avatar_name
///5 unban:full_avatar_name
///5 pass:full_avatar_name
///5 unpass:full_avatar_name
///5 clearban
///5 clearpass

// Define a variable to store the received command
string command;

// Define the default state
default
{
    // Event handler for state entry
    state_entry()
    {
        // Listen on channel 5 for commands from the owner
        llListen(5, "", llGetOwner(), "");
    }
    
    // Event handler for when the object is rezzed
    on_rez(integer param)
    {
        // Reset the script when rezzed
        llResetScript();
    }

    // Event handler for listening on channel 5
    listen(integer chan, string name, key id, string message)
    {
        // Check if a previous command is still processing
        if (command != "")
        {
            // Inform the owner that a command is still processing
            llOwnerSay("Sorry, still processing last command, try again in a second.");
        }
        
        // Parse the received message
        list args = llParseString2List(message, [":"], []);
        command = llToLower(llList2String(args, 0));
        
        // Process the command
        if (command == "clearbans")
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
            // Sensor for avatars in range
            llSensor(llList2String(args, 1), NULL_KEY, AGENT, 96, PI);
        }
    }
    
    // Event handler for when no avatars are detected by the sensor
    no_sensor()
    {
        // Reset the command since no avatars are detected
        command = "";
    }
    
    // Event handler for when avatars are detected by the sensor
    sensor(integer num)
    {
        integer i;
        for (i = 0; i < num; ++i)
        {
            // Process the command based on detected avatars
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
                // Remove the detected avatar from the ban list
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
        
        // Reset the command after processing
        command = "";
    }
}
