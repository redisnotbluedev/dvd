extends Control

var bounces: int
var shop_tween: Tween

func _on_bounce() -> void:
	bounces += 1
	$Label.text = str(bounces)

func _on_shop_toggled(toggled_on: bool) -> void:
	if shop_tween:
		shop_tween.kill()
	shop_tween = create_tween()
	shop_tween.set_ease(Tween.EASE_OUT)
	shop_tween.tween_property($Control, "offset_right", 0 if toggled_on else 200, 0.2)
	$Control/Button.text = ">" if toggled_on else "<"
