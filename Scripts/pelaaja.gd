extends CharacterBody2D

@export var liikkumisnopeus = 300.0 ## vaakanopeus
@export var hyppynopeus = -400.0	## pystynopeus
@export var kiihtyvyys = 15.0		## vaaka kiihtyminen
@export var hidastuminen = 150.0	## hidastuminen sivusuunnassa
@export var ilma_hidastuminen = 50	## hidastuminen sivusuunnassa (ilmassa))
var ammusspawni_offset = 10
var facing = 1

@export var luoti_skene: PackedScene


var painovoima = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	$AnimationPlayer.play("Idle")
	print($AnimationPlayer.current_animation)
	Globals.pelaaja = self

func _physics_process(delta: float) -> void:
	# Nopeuden y-komponentti (hyppääminen tai tippuminen).
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = hyppynopeus
	elif not is_on_floor():
		velocity.y += painovoima * delta
		
	# Nopeuden x-komponentti
	var suunta = Input.get_axis("left", "right")
	if suunta != 0:
		velocity.x = move_toward(velocity.x, liikkumisnopeus * suunta, kiihtyvyys)
		
	else:
		if is_on_floor():
			velocity.x = move_toward(velocity.x, 0, hidastuminen)
		else:
			velocity.x = move_toward(velocity.x, 0, ilma_hidastuminen)
		
		
	move_and_slide()
	aseta_animaatio(suunta)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			ammu()
			
func ammu():
	var luoti = luoti_skene.instantiate()
	luoti.global_position = global_position + Vector2(ammusspawni_offset * facing, 0)
	get_parent().add_child(luoti)
		
func aseta_animaatio(suunta: float):
	if suunta > 0:
		$AnimatedSprite2D.flip_h = false
		facing = 1
	elif suunta < 0:
		$AnimatedSprite2D.flip_h = true
		facing = -1
		
	if not is_on_floor():
		if velocity.y < 0:
			$AnimationPlayer.play("Jump_up")
		else:
			$AnimationPlayer.play("Jump_down")
	elif velocity.x != 0:
		$AnimationPlayer.play("Walk")
	else:
		$AnimationPlayer.play("Idle")
	
	#var vanha_animaatio = $AnimationPlayer.assigned_animation
	#
	#match $AnimationPlayer.assigned_animation:
		#"Paikallaan":
			#if velocity.y < 0:
				#if Globals.tikas_alue == true:
					#play("Tikkaat")
				#else:
					#$AnimationPlayer.play("Ponnistus")
			#elif velocity.y > 0:
				#$AnimationPlayer.play("Ilmassa_alas")
			#elif velocity.x != 0:
				#$AnimationPlayer.play("Kävely")
		#"Kävely":
			#if is_on_floor() and velocity.x == 0:
				#$AnimationPlayer.play("Paikallaan")
			#elif velocity.y < 0:
				#if Globals.tikas_alue == true:
					#$AnimationPlayer.play("Tikkaat")
				#else:
					#$AnimationPlayer.play("Ponnistus")
			#elif velocity.y > 0:
				#$AnimationPlayer.play("Ilmassa_alas")
		#"Ilmassa_ylös":
			#if is_on_floor():
				#$AnimationPlayer.play("Laskeutuminen")
			#elif velocity.y > 0:
				#$AnimationPlayer.play("Ilmassa_alas")
		#"Ilmassa_alas":
			#if is_on_floor():
				#$AnimationPlayer.play("Laskeutuminen")
		#"Laskeutuminen":
			#if velocity.x != 0:
				#$AnimationPlayer.play("Kävely")
			#elif $AnimationPlayer.current_animation == "":
				#$AnimationPlayer.play("Paikallaan")
		#"Ponnistus":
			#if $AnimationPlayer.current_animation == "":
				#$AnimationPlayer.play("Ilmassa_ylös")
		#"Tikkaat":
			#if Globals.tikas_alue == false:
				#$AnimationPlayer.play("Paikallaan")
		#_:
			#print("Tuntematon animaatio")
	#if $AnimationPlayer.assigned_animation != vanha_animaatio:
		#print($AnimationPlayer.assigned_animation)

func _process(delta: float) -> void:
	if Globals.elämät == 0:
		get_tree().quit()
