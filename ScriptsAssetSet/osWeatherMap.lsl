/*
This script sets up a dynamic texture on an object in OpenSim. 
It cycles through three different image URLs at a specified refresh rate. 
The state_entry() function initializes the script, the timer() function triggers the texture refresh based on the refresh rate, 
and the touch_start() function allows refreshing the texture when the object is touched.
*/

integer count = 0; // Variable to keep track of the refresh count
integer refreshRate = 300; // Refresh rate in seconds
string URL1 = "http://icons.wunderground.com/data/640x480/2xus_rd.gif"; // URL for the first image
string URL2 = "http://icons.wunderground.com/data/640x480/2xus_sf.gif"; // URL for the second image
string URL3 = "http://icons.wunderground.com/data/640x480/2xus_st.gif"; // URL for the third image
string dynamicID=""; // ID for the dynamic texture
string contentType="image"; // Content type of the dynamic texture

// Function to refresh the dynamic texture
refresh_texture()
{
    count++; // Increment the refresh count
    string url = ""; // Variable to hold the URL of the image
    integer c = count % 3; // Calculate the remainder when count is divided by 3
    
    // Determine which image URL to use based on the value of 'c'
    if (c == 0) {
        url = URL1; // Use URL1
    } else if (c == 1) {
        url = URL2; // Use URL2
    } else {
        url = URL3; // Use URL3
    }
    
    // Set the dynamic texture URL with the selected image URL and refresh rate
    osSetDynamicTextureURL(dynamicID, contentType, url, "", refreshRate);
}
        
default
{
    state_entry()
    {
        refresh_texture(); // Call the refresh_texture function when the script starts
        llSetTimerEvent(refreshRate); // Set a timer event to trigger every 'refreshRate' seconds
    }
   
    timer()
    {
        refresh_texture(); // Call the refresh_texture function when the timer event is triggered
    }
    
    touch_start(integer times)
    {
        refresh_texture(); // Call the refresh_texture function when the object is touched
    }
}
