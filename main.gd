extends Node2D

@export var dvd: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(1):
		var logo = dvd.instantiate()
		add_child(logo)
		logo.bounce.connect($UI/Control._on_bounce)
		
		await get_tree().create_timer(0.1).timeout
