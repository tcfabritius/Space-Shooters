extends Node2D

@export var enemy_skene: PackedScene
@onready var nav_alue = get_tree().get_first_node_in_group("navigation")

var spawnaus_väli := 5.0
var mennyt_aika := 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	while true:
		await get_tree().create_timer(spawnaus_väli).timeout
		mennyt_aika += spawnaus_väli
		# Nopeutus
		if mennyt_aika >= 20:
			mennyt_aika = 0
			spawnaus_väli = max(spawnaus_väli / 2, 0.2)
		spawnaa()

func spawnaa():
	var olio = enemy_skene.instantiate()
	olio.global_position = satunnainen_piste()
	get_parent().add_child(olio)

func satunnainen_piste() -> Vector2:
	var nav_poly = nav_alue.navigation_polygon
	var outline = nav_poly.get_outline(0)
	var a = outline[randi() % outline.size()]
	var b = outline[randi() % outline.size()]
	var kandidaatti = a.lerp(b, randf())
	return NavigationServer2D.map_get_closest_point(
		nav_alue.get_navigation_map(),
		kandidaatti
		)
