extends Control

signal joinignal
signal hostignal

func _on_hostbutton_pressed() -> void:
	emit_signal("hostignal")


func _on_joinbutton_pressed() -> void:
	emit_signal("joinignal")
