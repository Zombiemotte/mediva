extends Control


@onready var invslots : Array
var lifelist : Array
var current_inv : Dictionary

func _ready():
	invslots = $Slots.get_children()
	lifelist = $Life.get_children()
	
func manage(object):
	var filledslot = current_inv.keys()
	fillslot(filledslot.size(), object)
	current_inv[filledslot.size()] = object

func fillslot(slot, object):
	var tempnode : TextureRect = invslots[slot]
	tempnode.texture = object
	
func lifeinvisable(slot):
	lifelist[slot].visible = !lifelist[slot].visible
