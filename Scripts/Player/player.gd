class_name Player
extends CharacterBody2D

@export var SPEED: float = 60.0
var is_attacking: bool = false
@export var facing_direction: = Vector2.DOWN
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:


	var direction = Input.get_vector("Izquierda","Derecha","Arriba","Abajo")
	velocity = direction * SPEED
	if direction.x >0:
		animated_sprite_2d.play("walk_right")
	elif direction.x<0:
		animated_sprite_2d.play("walk_left")
	elif direction.y>0:
		animated_sprite_2d.play("walk_down")
	elif direction.y<0:
		animated_sprite_2d.play("walk_up")		
	move_and_slide()
	
