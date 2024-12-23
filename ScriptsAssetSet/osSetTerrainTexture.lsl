/*
osSetTerrainTexture(integer level, key texture)
    default: This is a default event handler in OpenSim scripts.
    state_entry(): This event is triggered when the script starts running.
    osSetTerrainTexture(layer, texture): This function sets the texture for the specified terrain layer. The first parameter (layer) specifies the terrain layer (0 to 3), and the second parameter (texture) specifies the UUID of the texture to be applied to that layer.
    osSetTerrainTextureHeight(layer, minHeight, maxHeight): This function sets the height range for the specified terrain layer. The first parameter (layer) specifies the terrain layer (0 to 3), the second parameter (minHeight) specifies the minimum height for the layer, and the third parameter (maxHeight) specifies the maximum height for the layer.

In summary, this script sets the textures and height ranges for four terrain layers within the virtual environment. Each layer is assigned a texture and a height range in meters.
*/

// Example osSetTerrainTexture

// Default Terrain Textures by djphil 2018
 
default
{
    state_entry()
    {
        osSetTerrainTexture(0, "b8d3965a-ad78-bf43-699b-bff8eca6c975"); // Sets the texture for terrain layer 0
        osSetTerrainTextureHeight(0, 10.0, 60.0); // Sets the height range for terrain layer 0
        osSetTerrainTexture(1, "abb783e6-3e93-26c0-248a-247666855da3"); // Sets the texture for terrain layer 1
        osSetTerrainTextureHeight(1, 10.0, 60.0); // Sets the height range for terrain layer 1
        osSetTerrainTexture(2, "179cdabd-398a-9b6b-1391-4dc333ba321f"); // Sets the texture for terrain layer 2
        osSetTerrainTextureHeight(2, 10.0, 60.0); // Sets the height range for terrain layer 2
        osSetTerrainTexture(3, "beb169c7-11ea-fff2-efe5-0f24dc881df2"); // Sets the texture for terrain layer 3
        osSetTerrainTextureHeight(3, 10.0, 60.0); // Sets the height range for terrain layer 3
    }
}
