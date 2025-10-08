extends Control


@onready var invslots : Array
var lifelist : Array
var current_inv : Dictionary

func _ready():
	invslots = $Slots.get_children()
	lifelist = $Life.get_children()
	dummydictionary()
	
func manage(object):
	var filledslots = current_inv.keys()
	for slot in filledslots:
		if current_inv[slot] == null:
			current_inv[slot] = object.name
			fillslot(slot, object.texture)
			return

func fillslot(slot, object):
	var tempnode : TextureRect = invslots[slot]
	tempnode.texture = object

func slotchoser(object):
	var filledslots = current_inv.keys()
	for slot in filledslots:
		if current_inv[slot] == object:
			empyslot(slot)
			return
	
func empyslot(slot):
	var tempnode : TextureRect = invslots[slot]
	tempnode.texture = null
	current_inv[slot] = null

	
func lifeinvisable(slot):
	lifelist[slot].visible = !lifelist[slot].visible

func dummydictionary():
	for n in 21:
		current_inv[n]= null
