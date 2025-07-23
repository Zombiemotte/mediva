extends Control

var wood = load("res://player/inventarholz.png")
@onready var invslots : Array
var current_inv : Dictionary

func _ready():
	invslots = $Slots.get_children()

func manage(object):
	var filledslot = current_inv.keys()
	fillslot(filledslot.size(), wood)
	current_inv[filledslot.size()] = object

func fillslot(slot, object):
	var tempnode : TextureRect = invslots[slot]
	tempnode.texture = object
	
