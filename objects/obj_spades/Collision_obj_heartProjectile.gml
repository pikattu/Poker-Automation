// Take damage from the projectile.
hp -= other.projectile_damage;

// Destroy the projectile.
instance_destroy(other);