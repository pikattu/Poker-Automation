// Stop spawning if one civilization is eliminated.
if (instance_number(obj_heart) == 0 ||
    instance_number(obj_spades) == 0) {
    exit;
}

// Spawn chips if below the limit.
if (instance_number(par_chip) < max_chips) {
    repeat (30) {
        var chip_x = irandom_range(220, 980);
        var chip_y = irandom_range(120, 580);

        var near_chip = instance_nearest(
            chip_x, chip_y, par_chip
        );

        if (near_chip == noone ||
            point_distance(
                chip_x, chip_y, near_chip.x, near_chip.y
            ) >= 48) {

            instance_create_layer(
                chip_x, chip_y, "Instances",
                choose(obj_redChip, obj_blueChip)
            );

            break;
        }
    }
}

// Schedule the next spawn.
alarm[0] = irandom_range(180, 300);