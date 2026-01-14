extends CharacterBody3D

var point : Vector3
var pointreached : bool
var movetimer : float
const SPEED : float = 3

func _ready() -> void:
	pointreached = true

func _physics_process(delta: float) -> void:
	movetimer += delta
	if pointreached:
		point = Vector3(randi_range(-100,100),0.5,randi_range(-100,100))
		pointreached = false
	#if movetimer > 0.5:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity = position.direction_to(point).normalized() * SPEED
	move_and_slide()
	#move_and_collide(position.direction_to(point))
#		movetimer = 0
	if position.distance_to(point) <= 2:
		pointreached = true 
	var lookdir = atan2(position.direction_to(point).x,position.direction_to(point).z)
	rotation.y = lookdir
		
func _on_area_3d_body_entered(body: Node3D) -> void:
	body.life -= 1
	print(body.life)
