extends Area2D

var nopeus = 80

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Kohde
	$NavigationAgent2D.target_position = Globals.pelaaja.position
	# Suunta
	var suunta = $NavigationAgent2D.get_next_path_position() - global_position
	suunta = suunta.normalized()
	
	if suunta.x < 0:
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
	
	global_position += (suunta * nopeus * delta)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("pelaaja"):
		var aani = $AudioStreamPlayer2D
		remove_child(aani)
		get_tree().current_scene.add_child(aani)
			
		aani.play()
		aani.finished.connect(aani.queue_free)

		Globals.elämät -= 1
		queue_free()
