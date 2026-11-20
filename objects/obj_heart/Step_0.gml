// Reduce attack cooldown.
if (attack_cooldown > 0) {
    attack_cooldown--;
}

// Find the nearest enemy.
var enemy = instance_nearest(x, y, target_object);

if (enemy != noone) {
    var dist = point_distance(x, y, enemy.x, enemy.y);

    // Move toward the enemy.
    if (dist > attack_range) {
        var move_dir = point_direction(
            x, y,
            enemy.x, enemy.y
        );

        x += lengthdir_x(move_speed, move_dir);
        y += lengthdir_y(move_speed, move_dir);
    }
    // Attack when close enough.
    else if (attack_cooldown <= 0) {
        enemy.hp -= attack_damage;
        attack_cooldown = attack_cooldown_max;
    }
}

// Die when HP reaches zero.
if (hp <= 0) {
    instance_destroy();
    exit;
}

// Stay inside the room.
x = clamp(x, 16, room_width - 16);
y = clamp(y, 16, room_height - 16);