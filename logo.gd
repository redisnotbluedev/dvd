extends CharacterBody2D

@export var speed: float = 1000.0
var direction: Vector2 = Vector2.from_angle(randf() * TAU)
signal bounce

func _ready() -> void:
	modulate = get_color()

func get_color() -> Color:
	return Color.from_hsv(randf(), 0.8, 1)

func _physics_process(delta: float) -> void:
	var velocity = direction * speed * delta
	var collision = move_and_collide(velocity)
	
	if collision:
		var normal = collision.get_normal()
		
		if velocity.dot(normal) < 0:
			direction = direction.bounce(collision.get_normal())
			modulate = get_color()
			bounce.emit()
