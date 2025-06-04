extends StaticBody3D
var treecount =10

func baumernten(player):
	player.rock +=1
	treecount -=1
	if treecount == 0:
		treeausotter.rpc()
		queue_free()




@rpc("any_peer","call_local")
func treeausotter():
	if is_multiplayer_authority():
		queue_free()
