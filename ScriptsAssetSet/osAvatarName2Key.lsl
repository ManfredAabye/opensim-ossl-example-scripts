/*
key osAvatarName2Key(string FirstName, string LastName)
This script demonstrates the usage of the osAvatarName2Key function, which returns an avatar's key based on their first and last names.
In the first version of the script, the first and last names are predefined as "John" and "Smith". When the object is touched, 
it retrieves the key of the avatar with the specified first and last names and displays both the name and key.
In the second version (commented out), the script dynamically extracts the name of the avatar who touched the object using llDetectedName(0), 
then parses the name to extract the first and last names. 
It then retrieves the key of the avatar with the extracted names and displays both the name and key.
*/

//
// osAvatarName2Key Script Example
// Author: djphil
// 

// Define the first and last names of the avatar
string FirstName = "John";
string LastName = "Smith";

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osAvatarName2Key is used
        llSay(PUBLIC_CHANNEL, "Touch to see osAvatarName2Key usage.");
    }

    touch_start(integer number)
    {
        // Concatenate the first and last names to form the full avatar name
        string AvatarName = FirstName + " " + LastName;

        // Call osAvatarName2Key function to get the key of the avatar based on first and last names
        key AvatarKey = osAvatarName2Key(FirstName, LastName);

        // Display the avatar name and key
        llSay(PUBLIC_CHANNEL, "The avatar name is " + AvatarName);   
        llSay(PUBLIC_CHANNEL, "The avatar key is " + (string)AvatarKey);    
    }
}

/*
//
// osAvatarName2Key Script Example
// Author: djphil
// 

default
{
    state_entry()
    {
        // Display a message prompting users to touch the object to see how osAvatarName2Key is used
        llSay(PUBLIC_CHANNEL, "Touch to see osAvatarName2Key usage.");
    }

    touch_start(integer number)
    {
        // Get the name of the avatar who touched the object
        string AvatarName = llDetectedName(0);
        
        // Parse the avatar name to extract first and last names
        list buffer = llParseString2List(AvatarName, [" "], []);
        string FirstName = llList2String(buffer, 0);
        string LastName = llList2String(buffer, 1);

        // Call osAvatarName2Key function to get the key of the avatar based on first and last names
        key AvatarKey = osAvatarName2Key(FirstName, LastName);

        // Display the avatar name and key
        llSay(PUBLIC_CHANNEL, "Your avatar name is " + AvatarName);   
        llSay(PUBLIC_CHANNEL, "Your avatar key is " + (string)AvatarKey);    
    }
}
*/
