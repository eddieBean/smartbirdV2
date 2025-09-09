extends RigidBody2D

signal hit

var screen_size

func _ready():
	var screen_size = get_viewport_rect().size
	
func _process(delta):
	if Input.is_action_pressed("jump"):
		var velocity = Vector2(0.0,50.0)
		position += velocity * delta
		position = position.clamp(Vector2.ZERO, screen_size)

func _on_body_entered(body):
	hit.emit()
	hide()
