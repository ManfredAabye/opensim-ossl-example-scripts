/*
osAddAgentToGroup(key AgentID, string GroupName, string RequestedRole)
GroupToJoin: This variable stores the name of the group that avatars will be added to.
RoleToJoin: This variable stores the name of the role within the group that avatars will be assigned.
state_entry(): This is a built-in event handler that is called when the script initializes. 
It displays a message indicating that users should touch the object to join the specified group.
touch_end(integer num): This is a built-in event handler that is called when an avatar touches the object containing the script. 
It retrieves the key (unique identifier) of the avatar that touched the object and then calls osAddAgentToGroup() to add the avatar to the specified group with the specified role.
*/

//
// osAddAgentToGroup Script Example
//

// Define the group name to join
string GroupToJoin = "Test Group";

// Define the role within the group to join
string RoleToJoin = "Everyone";

default
{
    state_entry()
    {
        // Display a message when the script initializes
        llSay(0,"Touch to use osAddAgentToGroup to add yourself to a group"); 
    }
 
    touch_end(integer num)
    {
        // Get the key of the avatar that touched the object
        key AgentID = llDetectedKey(0);
        
        // Add the avatar to the specified group with the specified role
        osAddAgentToGroup(AgentID, GroupToJoin, RoleToJoin);
    }
}
