extends CharacterBody2D

@export var speed: float = 300.0
var direction: Vector2 = Vector2(1, 1).normalized()

func _physics_process(delta: float):
	var velocity = direction * speed * delta
	var collision = move_and_collide(velocity)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		modulate = Color(randf(), randf(), randf())
