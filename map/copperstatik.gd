extends StaticBody3D
var treecount = 10
var wood = load("res://player/copper.png")

func baumernten(player):
	player.copper += 1
	treecount -= 1
	player.gather(wood);
	if treecount == 0:
		treeausotter.rpc()
		queue_free()


@rpc("any_peer", "call_local")
func treeausotter():
		queue_free()
