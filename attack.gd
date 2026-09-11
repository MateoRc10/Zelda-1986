class_name player 
extends CharacterBody2D

@export var SPEED: float = 60.0
var is_attacking : bool = false
var facing_direction := Vector2.DOWN
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Ataque"):
		attack()
	if is_attacking:
		return
	
	var direction = Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	velocity = direction * SPEED
	if direction.x >0:
		facing_direction = Vector2.RIGHT
		animated_sprite_2d.play("walk_right")
	elif direction.x <0:
		facing_direction = Vector2.LEFT
		animated_sprite_2d.play("walk_left")
	elif direction.y >0:
		facing_direction = Vector2.DOWN
		animated_sprite_2d.play("walk_down")
	elif direction.y <0:
		facing_direction = Vector2.UP
		animated_sprite_2d.play("walk_up")
	move_and_slide()
	
	#Cuando el personaje este quieto, ejecutamos la animación hacia la dirección donde donde este mirando y asi pausamos la animación
	if direction == Vector2.ZERO:
		if facing_direction == Vector2.UP:
			animated_sprite_2d.play("walk_up")
		elif facing_direction == Vector2.DOWN:
			animated_sprite_2d.play("walk_down")
		elif facing_direction == Vector2.RIGHT:
			animated_sprite_2d.play("walk_right")
		elif facing_direction == Vector2.LEFT:
			animated_sprite_2d.play("walk_left")
		animated_sprite_2d.pause()
		return

func attack () -> void:
	is_attacking = true
	
	if facing_direction == Vector2.UP:
		animated_sprite_2d.play("attack_up")
	elif facing_direction == Vector2.DOWN:
		animated_sprite_2d.play("attack_down")
	elif facing_direction == Vector2.RIGHT:
		animated_sprite_2d.play("attack_right")
	elif facing_direction == Vector2.LEFT:
		animated_sprite_2d.play("attack_left")
	await  animated_sprite_2d.animation_finished
	is_attacking = false
