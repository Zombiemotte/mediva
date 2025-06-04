extends StaticBody3D
var treecount =10

func baumernten(player):
	player.copper +=1
	treecount -=1
	if treecount == 0:
		treeausotter.rpc()
		queue_free()




@rpc("any_peer","call_local")
func treeausotter():
	queue_free()
