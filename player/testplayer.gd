extends CharacterBody3D
@export var camerapov =1500
var objekttreffer
var invfull : bool;
var wood =0
var copper =0
var rock =0
var life =3

signal Iwillbuild
signal deadplayer

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _enter_tree() -> void:
	set_multiplayer_authority(str(name).to_int())

func _ready() -> void:
	if not is_multiplayer_authority(): return
	$camfollow/Camera3D.current =true
	$inventar.visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	connect('deadplayer', get_parent().killdeadbody)
	connect('Iwillbuild', get_parent().get_node('testmap').spawn_object)
	
func _exit_tree() -> void:
	Input.mouse_mode =Input.MOUSE_MODE_VISIBLE
	
func _physics_process(delta: float) -> void:
	if not is_multiplayer_authority(): return
	if life  <= 0:
		death()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("schlagen"):
		treffer(delta)
	
	if Input.is_action_just_pressed("interagieren"):
		if wood > 0 :
			builde()
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("links", "rechts", "geradeaus", "zuruck")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	inventar()
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else :
			Input.mouse_mode =Input.MOUSE_MODE_VISIBLE

func _input(event):
	if not is_multiplayer_authority(): return
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x / camerapov
		rotation.x -= event.relative.y / camerapov
		
func treffer(delta):
	if $RayCast3D.is_colliding():
		objekttreffer = $RayCast3D.get_collider()
		if objekttreffer.is_in_group("resourcengruppe"):
			if invfull:
				life -= 1
				$inventar.lifeinvisable(life)
			else:
				objekttreffer.baumernten(self)


func inventar():
	if not is_multiplayer_authority(): return
	if Input.is_action_just_pressed("inventaranaus"):
		$inventar.visible = !$inventar.visible
		
func gather(object):
	var alreadyullslot = wood+copper+rock
	print(alreadyullslot)
	if not invfull:
		$inventar.manage(object);
	if alreadyullslot > 20:
		invfull = true
	
func builde():
	wood -= 1
	$inventar.slotchoser("wood")
	emit_signal("Iwillbuild")
	
	
func death():
	deadplayer.emit(self);
