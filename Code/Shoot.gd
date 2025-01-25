extends Node
class_name Shoot

func shoot(muzzle : Muzzle) -> void:
    var projectile = Projectile.instantiate()
    add_child(projectile)
    projectile.transform = muzzle.transform

    var hit = $RayCast.get_collider()
    if hit:
        if hit is Health:
            var health = hit as Health
            health.apply_damage(10)
        else:
            print("Hit something else")
    else:
        print("Hit nothing")
    
