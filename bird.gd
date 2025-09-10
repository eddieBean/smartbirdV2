extends RigidBody2D

signal hit

var screen_size

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		linear_velocity = Vector2(0.0,-450.0)

func _on_body_entered(body):
	hit.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
