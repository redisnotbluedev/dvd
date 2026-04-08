extends StaticBody2D

func _ready() -> void:
	get_tree().root.size_changed.connect(_on_viewport_size_changed)
	_on_viewport_size_changed()

func _on_viewport_size_changed():
	var screen_size: Vector2 = get_viewport().get_visible_rect().size
	$Bottom.position = screen_size
	$Right.position = screen_size
