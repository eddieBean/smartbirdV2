extends RigidBody2D

signal player_detected
var velocity

func _process(delta):
	pass
	#var last_frame_detection = false
	#if $PlayerDetectionLine.is_colliding():
		#print("player detected")
		#if last_frame_detection == false:
			#player_detected.emit()
		#last_frame_detection = false
	#else:
		#last_frame_detection = true





func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func set_velocity(_velocity: Vector2):
	velocity = _velocity

func _integrate_forces(state: PhysicsDirectBodyState2D):
	linear_velocity = velocity


func _on_scoring_box_body_entered(body: Node2D) -> void:
	print("detected: " + body.name)
	player_detected.emit(body.name)
