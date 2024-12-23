/*
osAvatarPlayAnimation(key avatar, string animation)
This script demonstrates the usage of the osAvatarPlayAnimation function, which plays an animation on the specified avatar.
The touch_start event is used as an example trigger to play the animation when the object is touched. 
It first retrieves the name of the animation from the object's inventory using llGetInventoryName, 
then plays this animation on the avatar who touched the object using osAvatarPlayAnimation.
The comment section provides additional notes on how to handle animations in objects that require the user to sit on them, such as chairs or poseballs. 
It suggests using the changed event to detect when the object's link set changes, then stopping any sit animations and playing the desired animation on the user.
*/

default
{
    touch_start(integer num)
    {
        // Get the name of the animation from the prim's inventory
        string anim = llGetInventoryName(INVENTORY_ANIMATION, 0);
        
        // Play the animation on the avatar who touched the object
        osAvatarPlayAnimation(llDetectedKey(0), anim);
    }
}

/*
Notes
When using this function in an object that requires the user to sit on the object (like a chair or a poseball), you will need to stop the sit animation by including the following snippet:

changed(integer change)
{
    // Check if there's a change in the link set
    if (change & CHANGED_LINK)
    {
        // Get the key of the user sitting on the object
        key user = llAvatarOnSitTarget();
        
        // Stop the sit animation
        osAvatarStopAnimation(user, "sit");
        
        // Play the desired animation on the user
        osAvatarPlayAnimation(user, anim);
    }
}
*/
