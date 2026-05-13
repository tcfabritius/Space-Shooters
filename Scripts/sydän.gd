extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body == %Pelaaja:
		print("Sydän otettu")
		Globals.elämät += 1
		queue_free.call_deferred()
