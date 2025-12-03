extends StaticBody3D
@export var treecount = 10
var wood = load("res://player/Stein.png")

func baumernten(player):
	player.rock += 1
	onupdatecounter.rpc()
	player.gather({"name" : "stone", "texture" : wood});
	if treecount == 0:
		treeausotter.rpc()



@rpc("any_peer", "call_local")
func treeausotter():
		queue_free()

@rpc("any_peer", "call_local")
func onupdatecounter():
	treecount -= 1
