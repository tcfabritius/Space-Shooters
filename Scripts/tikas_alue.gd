extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body == Globals.pelaaja:
		Globals.tikas_alue = true


func _on_body_exited(body: Node2D) -> void:
	if body == Globals.pelaaja:
		Globals.tikas_alue = false
