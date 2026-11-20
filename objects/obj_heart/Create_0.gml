hp = 15;
max_hp = 15;

 // Initialize the parent's variables first.
event_inherited();

// Civilization identity
civilization = "Heart";

// Sprinters trait: movement speed of 5
move_speed = 5;

// Ranged trait: projectiles deal 3 damage
is_ranged = true;
attack_range = 200;
attack_damage = 3;
projectile_damage = 3;
projectile_speed = 4;

// Ranged attack with a longer reload
attack_cooldown = 0;
attack_cooldown_max = 120;

// Cooperation trait
has_cooperation = true;
ally_object = obj_heart;

// Target the opposing civilization
target_object = obj_spades;
food_object = obj_redChip;

