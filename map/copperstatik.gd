extends StaticBody3D
@export var treecount = 10
var wood = load("res://player/copper.png")

func baumernten(player):
	print(treecount)
	player.copper += 1
	onupdatecounter.rpc()
	player.gather({"name" : "copper", "texture" : wood});
	print(treecount)
	if treecount == 0:
		treeausotter.rpc()

@rpc("any_peer", "call_local")
func onupdatecounter():
	treecount -= 1

@rpc("any_peer", "call_local")
func treeausotter():
		queue_free()
