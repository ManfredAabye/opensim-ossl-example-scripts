/*
llSetRenderMaterial( string material, integer face );
This script is designed to be run in a virtual environment like OpenSimulator (OpenSim). 
It's a simple script that retrieves the name of the first material alphabetically inside the same prim's inventory and sets that material on all sides of the prim containing the script.
*/

default
{
    // This function is called when the script starts or resets
    state_entry()
    {
        // Get the name of the first material alphabetically inside the same prim's inventory
        // llGetInventoryName(INVENTORY_TYPE, index) returns the name of an inventory item
        // INVENTORY_MATERIAL specifies that we're looking for materials
        // 0 is the index of the first material in the prim's inventory
        string material = llGetInventoryName(INVENTORY_MATERIAL, 0);

        // Set the retrieved material on all sides of the prim containing the script
        // llSetRenderMaterial(material, face) sets the render material for a face (side) of the prim
        // ALL_SIDES specifies that we want to set the material on all sides of the prim
        llSetRenderMaterial(material, ALL_SIDES);
    }
}

