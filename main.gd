extends Node

const PORT = 9999
const Player = preload("res://player/testplayer.tscn")



var peer = ENetMultiplayerPeer.new()


func _on_startmenu_hostignal() -> void:
	peer.create_server(PORT)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(add_player)
	$startmenu.queue_free()
	add_player(multiplayer.get_unique_id())

func _on_startmenu_joinignal() -> void:
	peer.create_client($startmenu/TextEdit.text,PORT)
	multiplayer.multiplayer_peer = peer
	$startmenu.queue_free()

func add_player(peer_id):
	var newplayer = Player.instantiate()
	newplayer.name = str(peer_id)
	add_child(newplayer)
	newplayer.global_position =Vector3(0,50,0)
	
	
