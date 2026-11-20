randomize();

// Number of creatures at the start.
spade_count = 10;
heart_count = 10;

// Card positions.
heart_card_x = [165, 165, 165, 165];
heart_card_y = [190, 288, 385, 475];

spade_card_x = [1028, 1028, 1028, 1028];
spade_card_y = [190, 285, 382, 476];

// Spawn Hearts.
for (var i = 0; i < heart_count; i++) {
    var card = i mod 4;

    instance_create_layer(
        heart_card_x[card] + irandom_range(-20, 20),
        heart_card_y[card] + irandom_range(-20, 20),
        "Instances",
        obj_heart
    );
}

// Spawn Spades.
for (var j = 0; j < spade_count; j++) {
    var card = j mod 4;

    instance_create_layer(
        spade_card_x[card] + irandom_range(-20, 20),
        spade_card_y[card] + irandom_range(-20, 20),
        "Instances",
        obj_spades
    );
}

// Initial chips.
repeat (15) {
    var chip_x = irandom_range(220, 980);
    var chip_y = irandom_range(120, 580);

    instance_create_layer(
        chip_x, chip_y, "Instances",
        choose(obj_redChip, obj_blueChip)
    );
}

max_chips = 25;
game_over = false;
winner = "";

alarm[0] = 120;