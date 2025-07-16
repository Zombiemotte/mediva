extends Node3D
var unno = load("res://map/unno.tscn")
var stone = load("res://map/stone.tscn")
var baum = load("res://map/baum.tscn")
var copper = load("res://map/copperstatik.tscn") 
var baum_2d = load("res://map/baum/baum_2d.tscn")
var randrom_world_gen = [unno,stone,baum,copper,baum_2d]


func _ready() -> void:
	init_map()
	
	
func init_map():
	for n in 100:
		var length = randrom_world_gen.size() -1
		var new_object = randrom_world_gen[randi_range(0,length)]
		var position = Vector3(randi_range(-62,62),0.3,randi_range(-62,62)) 
		var newplayer = new_object.instantiate()
		add_child(newplayer)
		newplayer.global_position =position
