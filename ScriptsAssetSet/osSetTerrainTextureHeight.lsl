/*
osSetTerrainTextureHeight(integer corner, float low, float high)
    default: This is a default event handler in OpenSim scripts.
    state_entry(): This event is triggered when the script initializes or enters its default state.
    osSetTerrainTexture(layer, texture): This function sets the texture for a specified terrain layer. The first parameter (layer) indicates the terrain layer (0 to 3), and the second parameter (texture) specifies the UUID of the texture to be applied.
    osSetTerrainTextureHeight(layer, minHeight, maxHeight): This function sets the height range for a specified terrain layer. The first parameter (layer) indicates the terrain layer (0 to 3), while the second parameter (minHeight) and third parameter (maxHeight) specify the minimum and maximum heights, respectively, for that layer.

In summary, this script sets terrain textures and their corresponding height ranges for four different terrain layers within the virtual environment when the script is initialized.
*/

// Example osSetTerrainTexture

// Default Terrain Textures by djphil 2018
 
default
{
    state_entry()
    {
        osSetTerrainTexture(0, "b8d3965a-ad78-bf43-699b-bff8eca6c975"); // Sets texture for terrain layer 0
        osSetTerrainTextureHeight(0, 10.0, 60.0); // Sets height range for terrain layer 0
        osSetTerrainTexture(1, "abb783e6-3e93-26c0-248a-247666855da3"); // Sets texture for terrain layer 1
        osSetTerrainTextureHeight(1, 10.0, 60.0); // Sets height range for terrain layer 1
        osSetTerrainTexture(2, "179cdabd-398a-9b6b-1391-4dc333ba321f"); // Sets texture for terrain layer 2
        osSetTerrainTextureHeight(2, 10.0, 60.0); // Sets height range for terrain layer 2
        osSetTerrainTexture(3, "beb169c7-11ea-fff2-efe5-0f24dc881df2"); // Sets texture for terrain layer 3
        osSetTerrainTextureHeight(3, 10.0, 60.0); // Sets height range for terrain layer 3
    }
}
