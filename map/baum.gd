extends StaticBody3D
var treecount =2

func baumernten(player):
	treeotter.rpc()
	player.wood +=1
	treecount -=1
	if treecount == 0:
		treeausotter.rpc()
		queue_free()

@rpc("any_peer","call_local")
func treeotter():
	rotate_x(40)


@rpc("any_peer","call_remote")
func treeausotter():
	if is_multiplayer_authority():
		queue_free()
