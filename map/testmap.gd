extends Node3D
var unno = load("res://map/unno.tscn")
var stone = load("res://map/stone.tscn")
var baum = load("res://map/baum.tscn")
var copper = load("res://map/copperstatik.tscn") 
var baum_2d = load("res://map/baum/baum_2d.tscn")
var grasstitescree = load( "res://map/grasstiteslscree.tscn")
#var randrom_world_gen = [unno,stone,baum,copper,baum_2d,grasstitescree]
@export var host_init : bool;
@export var preloadassets : Array[PackedScene];
@export var bauassets : Dictionary[String,PackedScene];
@export var buildwood: PackedScene;

var loadassets: Array[Resource];



	
func init_map():
	if not multiplayer.is_server():
		return
	#for asset in preloadassets:
		#loadassets.append(asset.instantiate())
	for n in 0 :
		var length = preloadassets.size() -1
		var new_object = preloadassets[randi_range(0,length)]
		var position = Vector3(randi_range(-62,62),0.3,randi_range(-62,62))
		var rota = Vector3(0,randi_range(0,359),0)
		var newplayer = new_object.instantiate()
		add_child(newplayer,true)
		newplayer.global_position =position
		newplayer.global_rotation = rota
	print('map generated')


func _on_main_seedsync() -> void:
	init_map()
	
func spawn_object(spawn_posi : Vector3):
	spawn_wood.rpc(spawn_posi)

@rpc("any_peer", "call_local")
func spawn_wood(spawn_posi : Vector3):
	if not multiplayer.is_server():
		return
	print('ihabholz')
	var newplayer = buildwood.instantiate()
	add_child(newplayer,true)
	newplayer.rotation = Vector3(80,0,0)
	newplayer.global_position = Vector3(spawn_posi.x,0.3,spawn_posi.z)
