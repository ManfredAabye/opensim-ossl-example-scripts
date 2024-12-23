/*
osMakeNotecard(string notecardName, list contents)
    When the object is touched (touch_start event), it retrieves the key (UUID) of the avatar touching it using llDetectedKey(0).
    It then converts the avatar's key into their name using llKey2Name(id).
    Information about the avatar (name, key, position, and rotation) is added to a list named contents.
    The osMakeNotecard function is used to create a notecard with the avatar's name and the contents list.
    The created notecard is given to the avatar using llGiveInventory(id, name).
    Finally, the notecard is removed from the object's inventory using llRemoveInventory(name).
*/

// osMakeNotecard example by Tom Earth
 
default
{
    touch_start(integer n)
    {
        // Get the key (UUID) of the avatar touching the object
        key id = llDetectedKey(0);
        
        // Convert the avatar's key into their name
        string name = llKey2Name(id);
        
        // Create a list to store the contents of the notecard
        list contents;
        
        // Add information about the avatar to the contents list
        contents += ["Name: "+name+"\n"];
        contents += ["Key: "+(string)id+"\n"];
        contents += ["Pos: "+(string)llDetectedPos(0)+"\n"];
        contents += ["Rotation: "+(string)llDetectedRot(0)+"\n"];
 
        // Create a notecard with the avatar's name and the contents list
        osMakeNotecard(name,contents);
 
        // Give the created notecard to the avatar
        llGiveInventory(id,name);
        
        // Remove the notecard from the object's inventory
        llRemoveInventory(name);
    }
}
