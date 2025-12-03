extends RigidBody3D

func _physics_process(delta: float) -> void:
	var direction = Vector3(randi_range(-1,1),0,randi_range(-1,1))
	move_and_collide(direction)

func _on_area_3d_body_entered(body: Node3D) -> void:
	body.life -= 1
	print(body.life)
