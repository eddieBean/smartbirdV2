extends RigidBody2D

signal player_detected

func _process(delta):
	if $PlayerDetectionLine.is_colliding():
		print("player detected")
		player_detected.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
