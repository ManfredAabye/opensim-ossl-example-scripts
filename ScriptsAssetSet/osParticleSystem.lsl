/*
osParticleSystem(list rules)
    burst_radius: Radius within which particles are emitted.
    angle_begin, angle_end: Angles defining the cone within which particles are emitted.
    target: Key of the target object for particle emission.
    start_color, end_color: Starting and ending colors of particles.
    start_alpha, end_alpha: Starting and ending alpha values (transparency) of particles.
    start_scale, end_scale: Starting and ending scale of particles.
    texture: UUID of the texture applied to particles.
    start_glow, end_glow: Starting and ending glow values of particles.
    source_max_age: Maximum age of the particle emitter.
    particle_max_age: Maximum age of individual particles.
    burst_rate: Rate at which bursts of particles are emitted.
    burst_particle_count: Number of particles emitted in each burst.
    acceleration: Acceleration applied to particles.
    omega: Angular velocity applied to particles.
    speed_min, speed_max: Minimum and maximum speeds of particles.

The Particles() function defines the parameters for the particle system and calls osParticleSystem to create it. The various PSYS_ constants and their corresponding values configure the behavior, appearance, blending, flow, and motion of the particle system.

The default state calls the Particles() function in its state_entry() event, effectively creating the particle system when the script is initialized or reset.

Overall, this script generates a customizable particle effect within a defined area, emitting particles with specific colors, transparency, scale, texture, and motion characteristics.
*/

//Written By Draconis Neurocam
//You are free:
//    * to Share — to copy, distribute and transmit the work
//    * to Remix — to adapt the work
//Under the following conditions:
//    *
//      Attribution. You must attribute the work in the manner specified by the author or licensor (but not in any way that suggests that they endorse you or your use of the work).
//      Attribute this work:
//      What does "Attribute this work" mean?
//      The page you came from contained embedded licensing metadata, including how the creator wishes to be attributed for re-use. You can use the HTML here to cite the work.
//      Doing so will also include metadata on your page so that others can find the original work as well.
//    * For any reuse or distribution, you must make clear to others the license terms of this work. The best way to do this is with a link to this web page.
//    * Any of the above conditions can be waived if you get permission from the copyright holder.
//    * Nothing in this license impairs or restricts the author's moral rights.
//http://creativecommons.org/licenses/by/3.0/
 
float burst_radius = 1.0;
float angle_begin  = PI_BY_TWO;
float angle_end    = PI_BY_TWO;
key   target       = "";
 
vector  start_color = <0.5,0.0,1.0>;
vector  end_color   = <0.0,0.0,0.0>;
float   start_alpha = 1.0;
float   end_alpha   = 0.1;
vector  start_scale = <0.5,0.5,0.5>;
vector  end_scale   = <1.0,1.0,1.0>;
key     texture     = "dcab6cc4-172f-e30d-b1d0-f558446f20d4";
float   start_glow  = 0.0;
float   end_glow    = 0.0;
 
float   source_max_age       = 0.0;
float   particle_max_age     = 2.0;
float   burst_rate           = 0.02;
integer burst_particle_count = 2;
 
vector  acceleration = <0.0,1.0,1.0>;
vector  omega        = <2.0,0.0,0.0>;
float   speed_min    = 1.0;
float   speed_max    = 1.0;
 
Particles()
{
    osParticleSystem([
 
        //System Behaviour
        PSYS_PART_FLAGS,
                            //PSYS_PART_BOUNCE_MASK
                            PSYS_PART_EMISSIVE_MASK
                            //| PSYS_PART_FOLLOW_SRC_MASK
                            | PSYS_PART_FOLLOW_VELOCITY_MASK
                            | PSYS_PART_INTERP_COLOR_MASK
                            | PSYS_PART_INTERP_SCALE_MASK
                            //| PSYS_PART_RIBBON_MASK
                            //| PSYS_PART_TARGET_LINEAR_MASK
                            //| PSYS_PART_TARGET_POS_MASK
                            //| PSYS_PART_WIND_MASK
                            ,
 
        //System Presentation
        PSYS_SRC_PATTERN,
                        //PSYS_SRC_PATTERN_ANGLE
                        //PSYS_SRC_PATTERN_ANGLE_CONE
                        //PSYS_SRC_PATTERN_ANGLE_CONE_EMPTY
                        PSYS_SRC_PATTERN_DROP
                        //PSYS_SRC_PATTERN_EXPLODE
                        ,
 
        PSYS_SRC_BURST_RADIUS, burst_radius,
        //PSYS_SRC_INNERANGLE, angle_begin,     //Either or
        //PSYS_SRC_OUTERANGLE, angle_end,
        PSYS_SRC_ANGLE_BEGIN,  angle_begin,     //Either or
        PSYS_SRC_ANGLE_END,    angle_end,
        PSYS_SRC_TARGET_KEY,   target,
 
        //Particle appearance
        PSYS_PART_START_COLOR, start_color,
        PSYS_PART_END_COLOR,   end_color,
        PSYS_PART_START_ALPHA, start_alpha,
        PSYS_PART_END_ALPHA,   end_alpha,
        PSYS_PART_START_SCALE, start_scale,
        PSYS_PART_END_SCALE,   end_scale,
        PSYS_SRC_TEXTURE,      texture,
        PSYS_PART_START_GLOW,  start_glow,
        PSYS_PART_END_GLOW,    end_glow,
 
        //Particle Blending
        PSYS_PART_BLEND_FUNC_SOURCE,
                                    //PSYS_PART_BF_ONE
                                    //PSYS_PART_BF_ZERO
                                    //PSYS_PART_BF_DEST_COLOR
                                    //PSYS_PART_BF_SOURCE_COLOR
                                    //PSYS_PART_BF_ONE_MINUS_DEST_COLOR
                                    //PSYS_PART_BF_ONE_MINUS_SOURCE_COLOR
                                    PSYS_PART_BF_SOURCE_ALPHA
                                    //PSYS_PART_BF_ONE_MINUS_SOURCE_ALPHA
                                    ,
        PSYS_PART_BLEND_FUNC_DEST,
                                    //PSYS_PART_BF_ONE
                                    //PSYS_PART_BF_ZERO
                                    //PSYS_PART_BF_DEST_COLOR
                                    //PSYS_PART_BF_SOURCE_COLOR
                                    //PSYS_PART_BF_ONE_MINUS_DEST_COLOR
                                    //PSYS_PART_BF_ONE_MINUS_SOURCE_COLOR
                                    //PSYS_PART_BF_SOURCE_ALPHA
                                    PSYS_PART_BF_ONE_MINUS_SOURCE_ALPHA
                                    ,
 
        //Particle Flow
        PSYS_SRC_MAX_AGE,          source_max_age,
        PSYS_PART_MAX_AGE,         particle_max_age,
        PSYS_SRC_BURST_RATE,       burst_rate,
        PSYS_SRC_BURST_PART_COUNT, burst_particle_count,
 
        //Particle Motion
        PSYS_SRC_ACCEL,           acceleration,
        PSYS_SRC_OMEGA,           omega,
        PSYS_SRC_BURST_SPEED_MIN, speed_min,
        PSYS_SRC_BURST_SPEED_MAX, speed_max
 
        ]);
}
 
default
{
    state_entry()
    {
        Particles();
    }
}
