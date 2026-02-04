extends RigidBody3D

func on_bau():
	$Bau.visible = !$Bau.visible
	$wood.visible = !$wood.visible
	set_physics_process(false)
