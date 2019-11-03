///x_spawn_zombie(zombie sprite type, lane number, speed)

//Spawn the zombie out of sight
zombie = instance_create(room_width, room_height, o_zombie);

//Get index for lane
lane = asset_get_index("p_lane" + string(argument1));

//Get index for sprite
sprite = asset_get_index("s_zombie_" + argument0);

//Send the zombie on its way
with(zombie) {

    //Set the sprite
    sprite_index = other.sprite;
    
    //Set animation setting
    skeleton_animation_set("walking");
    skeleton_skin_set("regular");
    skeleton_animation_mix("walking", "eating", 0.5);
    skeleton_animation_mix("eating", "walking", 0.5);
    
    //Scale
    image_xscale = 1.2;
    image_yscale = 1.2;
    
    //Put zombie on path
    path_start(other.lane, argument2, 0, true);
    
    //Set depth
    depth = -y;
    
    //Set energy for zombie
    energy = 100;
    
    //Set some variables to easily swap out of animations
    first_collide = true;
    path_spd = path_speed;
    
}
