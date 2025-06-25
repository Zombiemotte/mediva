extends Node3D
var unno = load("res://map/unno.tscn")
var stone = load("res://map/stone.tscn")
var baum = load("res://map/baum.tscn")
var copper = load("res://map/copperstatik.tscn") 
var randrom_world_gen = [unno,stone,baum,copper]



func _ready() -> void:
	init_map()
	
	
func init_map():
	for n in 100:
		var new_object = randrom_world_gen[randi_range(0,3)]
		var position = Vector3(randi_range(0,20),0,randi_range(0,20)) 
		var newplayer = new_object.instantiate()
		add_child(newplayer)
		newplayer.global_position =position
