extends StaticBody3D
@export var treecount = 2
var wood = load("res://player/inventarholz.png")

func baumernten(player):
	print(treecount)
	treeotter.rpc()
	player.wood += 1
	player.gather({"name" : "wood", "texture" : wood});
	onupdatecounter.rpc()
	print(treecount)
	if treecount == 0:
		treeausotter.rpc()

@rpc("any_peer", "call_local")
func treeotter():
	rotate_x(55)


@rpc("any_peer", "call_local")
func treeausotter():
		queue_free()

@rpc("any_peer", "call_local")
func onupdatecounter():
	treecount -= 1
