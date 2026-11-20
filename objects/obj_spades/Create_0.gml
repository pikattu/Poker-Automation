// Initialize the parent's variables first.
event_inherited();

// Civilization identity
civilization = "Spades";

// Health: 20 HP
hp = 20;
max_hp = 20;

// Energy: maximum of 10
energy = 10;
max_energy = 10;

// Movement and melee combat
move_speed = 3;
is_ranged = false;
attack_damage = 5;
attack_range = 40;

// Attack once per second (at 60 FPS)
attack_cooldown = 0;
attack_cooldown_max = 60;

// Targets and food
ally_object = obj_spades;
target_object = obj_heart;
food_object = obj_blueChip;

