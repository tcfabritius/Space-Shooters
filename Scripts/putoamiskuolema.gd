extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body == Globals.pelaaja:
		print("Törmättiin putoamiskuolemaan")
		$Timer.start()
		$"../Pelaaja/Camera2D".limit_bottom = 750


func _on_timer_timeout() -> void:
	$"../Pelaaja/Camera2D".limit_bottom = 650
	Globals.pelaaja.global_position = %Ylösnousemuspiste.global_position
