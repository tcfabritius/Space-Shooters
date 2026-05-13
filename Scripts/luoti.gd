extends Area2D

var nopeus = 400
var suunta = Vector2.ZERO

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	suunta = (get_global_mouse_position() - global_position).normalized()
	await get_tree().create_timer(5.0).timeout
	queue_free.call_deferred()

func _process(delta):
	global_position += suunta * nopeus * delta

func _on_area_entered(area: Area2D) -> void:
	Globals.pisteet += 10
	area.queue_free.call_deferred()
	queue_free.call_deferred()

func _on_body_entered(body: Node2D) -> void:
	queue_free.call_deferred()
