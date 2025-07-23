extends StaticBody3D
@export var treecount = 2
var wood = load("res://player/inventarholz.png")

func baumernten(player):
	treeotter.rpc()
	player.wood += 1
	player.gather(wood);
	treecount -= 1
	if treecount == 0:
		treeausotter.rpc()
		queue_free()

@rpc("any_peer", "call_local")
func treeotter():
	rotate_x(40)


@rpc("any_peer", "call_local")
func treeausotter():
		queue_free()
