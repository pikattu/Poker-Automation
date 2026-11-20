// shared survival stats
energy = 10;
max_energy = 10;

// Hunger
drain_timer = 60;
hunger_level = 6;

// Shared combat settings
attack_damage = 5;
attack_range = 24;
attack_cooldown = 0;
attack_cooldown_max = 60;

// Civilization settings
target_object = noone;
ally_object = noone;
food_object = noone;

// Trait switches
is_ranged = false;
has_cooperation = false;

// Ranged attack settings
projectile_speed = 10;
projectile_damage = 3;

// Each clone gets a slightly different shade
var b = irandom_range(200, 255);
image_blend = make_colour_rgb(b, b, b);

// Spiny switch 
is_spiny = false;

nearest_ally = noone;
nearest_dist = 1000000;

