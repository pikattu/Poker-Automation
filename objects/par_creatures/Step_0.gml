// Die if health reaches zero.
if (hp <= 0) {
    instance_destroy();
    exit;
}

// Table boundaries.
var left_bound = 110;
var right_bound = 1000;
var top_bound = 100;
var bottom_bound = 600;

// Reduce attack cooldown.
if (attack_cooldown > 0) {
    attack_cooldown--;
}

// Hunger - lose energy, then HP
drain_timer --;
if (drain_timer <= 0) {
    drain_timer = 60;
    if (energy > 0) energy -= 1;
    else hp -= 1;
}

// Find Chips
var chip = noone;
if (food_object != noone)   chip  = instance_nearest(x, y, food_object);


// Find the nearest enemy.
var enemy = noone;

if (target_object != noone) {
    enemy = instance_nearest(x, y, target_object);
}

// Eat when touching a chip
if (chip != noone && energy < max_energy) {
    if (point_distance(x, y, chip.x, chip.y) < 16) {
        energy = min(max_energy, energy + 3);
        instance_destroy(chip);
        chip = noone;
    }
}

// Hungry: go to food.
if (energy < hunger_level && chip != noone) {
    var fd = point_direction(x, y, chip.x, chip.y);
    var next_x = x + lengthdir_x(move_speed, fd);
    var next_y = y + lengthdir_y(move_speed, fd);

    // Keep movement inside the table.
    x = clamp(next_x, left_bound, right_bound);
    y = clamp(next_y, top_bound, bottom_bound);
}


 // Otherwise, fight.
else if (enemy != noone) {
    var dist = point_distance(x, y, enemy.x, enemy.y);

    
 // Keep ranged Hearts away from enemies, but allow enemies to catch up.
	if (is_ranged && dist < 80) {
	    var retreat_dir = point_direction(
	        enemy.x, enemy.y, x, y
	    );

	    var retreat_speed = move_speed * 0.75;

	    x += lengthdir_x(retreat_speed, retreat_dir);
	    y += lengthdir_y(retreat_speed, retreat_dir);
	}


    // Move toward the enemy if too far away.
    else if (dist > attack_range) {
        var move_dir = point_direction(
            x, y, enemy.x, enemy.y
        );

        // Cooperation: steer toward nearby allies.
        if (has_cooperation && ally_object != noone) {
		    var nearest_ally = noone;
		    var nearest_dist = 1000000;

            with (ally_object) {
                if (id != other.id) {
                    var ally_dist = point_distance(
                        other.x, other.y, x, y
                    );

                    if (ally_dist < other.nearest_dist) {
                        other.nearest_dist = ally_dist;
                        other.nearest_ally = id;
                    }
                }
            }

            if (nearest_ally != noone) {
                var ally_dir = point_direction(
                    x, y, nearest_ally.x, nearest_ally.y
                );

                var dx = lengthdir_x(1, move_dir)
                       + 0.35 * lengthdir_x(1, ally_dir);

                var dy = lengthdir_y(1, move_dir)
                       + 0.35 * lengthdir_y(1, ally_dir);

                move_dir = point_direction(0, 0, dx, dy);
            }
        }

        x += lengthdir_x(move_speed, move_dir);
        y += lengthdir_y(move_speed, move_dir);
    }

    // Attack when in range.
    else if (attack_cooldown <= 0) {
        if (is_ranged) {
            var bullet = instance_create_layer(
                x, y, "Instances", obj_heartProjectile
            );

            bullet.target = enemy;
            bullet.projectile_damage = projectile_damage;
            bullet.projectile_speed = projectile_speed;

            sprite_index = spr_heartAttack;
            image_index = 0;
            image_speed = 0.5;
        }
        else {
            enemy.hp -= attack_damage;

            if (enemy.hp <= 0) {
                energy = min(max_energy, energy + 5);
            }

            sprite_index = spr_spadesAttack;
            image_index = 0;
            image_speed = 0.5;
        }

        attack_cooldown = attack_cooldown_max;
    }
}


 // Separate overlapping creatures
var separation_distance = 32;
var push_x = 0;
var push_y = 0;
var my_id = id;

with (par_creatures) {
    if (id != my_id) {
        var dist = point_distance(x, y, my_id.x, my_id.y);

        if (dist < separation_distance) {
            var angle;

            if (dist > 0) {
                angle = point_direction(x, y, my_id.x, my_id.y);
            } else {
                angle = irandom(359);
            }

            var force = (separation_distance - dist) / separation_distance;

            push_x += lengthdir_x(force, angle);
            push_y += lengthdir_y(force, angle);
        }
    }
}

x += push_x * 1.5;
y += push_y * 1.5;

// Keep creatures inside the table
x = clamp(x, left_bound, right_bound);
y = clamp(y, top_bound, bottom_bound);

