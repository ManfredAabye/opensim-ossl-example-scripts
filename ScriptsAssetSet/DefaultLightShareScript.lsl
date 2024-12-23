/*
 Conversions

Here are some conversions from the WindLight XML to the LightShare settings that I managed to figure out. The format is really pretty much insane.

    ambient -> WL_AMBIENT (all four entries apply; apparently, you have to divide the first 3 entries by the 4th one, and include the 4th as is)
    blue_density -> WL_BLUE_DENSITY (all four entries apply; apparently, you have to divide the first 3 entries by WL_DENSITY_MULTIPLIER and keep the 4th as is)
    blue_horizon -> WL_HORIZON (all four entries apply; apparently, you have to divide the first 3 entries by WL_DENSITY_MULTIPLIER and keep the 4th as is)
    cloud_color -> WL_CLOUD_COLOR (all four entries apply)
    cloud_pos_density1 -> WL_CLOUD_XY_DENSITY (3rd entry becomes 1st; 2nd entry becomes 2nd entry; 4th entry becomes 3rd; 1st entry ignored)
    cloud_pos_density2 -> WL_CLOUD_XY_DETAIL_DENSITY (3rd entry becomes 1st; 2nd entry becomes 2nd entry; 4th entry becomes 3rd; 1st entry ignored)
    cloud_scale -> WL_CLOUD_SCALE (use just the first entry)
    cloud_scroll_rate -> first entry goes to WL_CLOUD_SCROLL_X, second entry goes to WL_CLOUD_SCROLL_Y (unknown, the math doesn't make sense)
    cloud_shadow -> WL_CLOUD_COVERAGE (use first entry)
    density_multiplier -> WL_DENSITY_MULTIPLIER (use first entry multiplied by 1000)
    distance_multiplier -> WL_DISTANCE_MULTIPLIER (use first entry)
    east_angle -> WL_EAST_ANGLE
    enable_cloud_scroll -> first entry goes to WL_CLOUD_SCROLL_X_LOCK, second entry to WL_CLOUD_SCROLL_Y_LOCK (0 becomes TRUE and 1 becomes FALSE)
    gamma -> WL_SCENE_GAMMA (use first entry)
    glow -> second entry to WL_SUN_GLOW_FOCUS (times 100), math for WL_SUN_GLOW_SIZE is unknown
    haze_density -> WL_HAZE_DENSITY (use first entry)
    haze_horizon -> WL_HAZE_HORIZON (use first entry; others ignored?)
    lightnorm -> unsupported?
    max_y -> WL_MAX_ALTITUDE (use first entry)
    preset_num -> not used
    star_brightness -> WL_STAR_BRIGHTNESS
    sun_angle -> WL_SUN_MOON_POSITION (requires some weird, unknown math)
    sunlight_color -> WL_SUN_MOON_COLOR (all four entries apply) 
*/

//
// Default LightShare Script Example
// Author: djphil
//
 
// Define a list of settings for LightShare
list settings = [
    WL_WATER_COLOR, <4.0, 38.0, 64.0>,  // Set water color
    WL_WATER_FOG_DENSITY_EXPONENT, 4.0,  // Set water fog density exponent
    WL_UNDERWATER_FOG_MODIFIER, 0.25,    // Set underwater fog modifier

    WL_REFLECTION_WAVELET_SCALE, <2.0, 2.0, 2.0>,  // Set reflection wavelet scale
    WL_FRESNEL_SCALE, 0.4,              // Set Fresnel scale
    WL_FRESNEL_OFFSET, 0.5,             // Set Fresnel offset

    // Set refraction scale above and below water
    WL_REFRACT_SCALE_ABOVE, 0.03,
    WL_REFRACT_SCALE_BELOW, 0.2,
    WL_BLUR_MULTIPLIER, 0.04,           // Set blur multiplier

    // Set big and little wave directions
    WL_BIG_WAVE_DIRECTION, <1.05, -0.42, 0.0>,
    WL_LITTLE_WAVE_DIRECTION, <1.11, -1.16, 0.0>,

    WL_NORMAL_MAP_TEXTURE, "822ded49-9a6c-f61c-cb89-6df54f42cdf4",  // Set normal map texture

    WL_HORIZON, <0.25, 0.25, 0.32, 0.32>,  // Set horizon color
    WL_HAZE_HORIZON, 0.19,              // Set haze horizon

    WL_BLUE_DENSITY, <0.12, 0.22, 0.38, 0.38>,  // Set blue density
    WL_HAZE_DENSITY, 0.70,              // Set haze density

    WL_DENSITY_MULTIPLIER, 0.18,        // Set density multiplier
    WL_DISTANCE_MULTIPLIER, 0.8,        // Set distance multiplier
    WL_MAX_ALTITUDE, 1605,              // Set max altitude

    WL_SUN_MOON_POSITION, 0.317,        // Set sun/moon position
    WL_SUN_MOON_COLOR, <0.24, 0.26, 0.3, 0.3>,  // Set sun/moon color
    WL_AMBIENT, <0.35, 0.35, 0.35, 0.35>,  // Set ambient light
    WL_EAST_ANGLE, 0.0,                 // Set east angle

    WL_SUN_GLOW_FOCUS, 0.1,             // Set sun glow focus
    WL_SUN_GLOW_SIZE, 1.75,             // Set sun glow size
    WL_SCENE_GAMMA, 1.0,                // Set scene gamma
    WL_STAR_BRIGHTNESS, 0.0,            // Set star brightness

    WL_CLOUD_COLOR, <0.41, 0.41, 0.41, 0.41>,  // Set cloud color
    WL_CLOUD_XY_DENSITY, <1.0, 0.53, 1.0>,  // Set cloud XY density

    WL_CLOUD_COVERAGE, 0.27,            // Set cloud coverage
    WL_CLOUD_SCALE, 0.42,               // Set cloud scale
    WL_CLOUD_DETAIL_XY_DENSITY, <1.0, 0.53, 0.12>,  // Set cloud detail XY density

    WL_CLOUD_SCROLL_X, 0.2,             // Set cloud scroll X
    WL_CLOUD_SCROLL_Y, 0.01,            // Set cloud scroll Y
    WL_DRAW_CLASSIC_CLOUDS, TRUE,       // Set draw classic clouds
    WL_CLOUD_SCROLL_X_LOCK, FALSE,      // Set cloud scroll X lock
    WL_CLOUD_SCROLL_Y_LOCK, FALSE       // Set cloud scroll Y lock
];

default
{
    state_entry()
    {
        // Display a message indicating how to use the script
        llSay(PUBLIC_CHANNEL, "Touch to see Default LightShare Script usage.");
    }

    touch_start(integer number)
    {
        // Set LightShare values using the predefined settings
        integer result = lsSetWindlightScene(settings);

        // Check if setting LightShare values was successful
        if (result == TRUE)
        {
            // Display success message
            llSay(PUBLIC_CHANNEL, "The LightShare values are now set to default values with success.");
        }
        else
        {
            // Display failure message
            llSay(PUBLIC_CHANNEL, "The LightShare values are now set to default values without success.");
        }
    }
}
