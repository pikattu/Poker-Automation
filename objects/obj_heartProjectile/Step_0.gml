
if (!instance_exists(target)) {
    instance_destroy();
    exit;
}

// Move toward the target.
var dir = point_direction(x, y, target.x, target.y);

x += lengthdir_x(projectile_speed, dir);
y += lengthdir_y(projectile_speed, dir);

// Destroy if it leaves the room.
if (x < 0 || x > room_width ||
    y < 0 || y > room_height) {
    instance_destroy();
}
