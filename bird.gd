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

func game_over():
	hit.emit()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)

func _on_body_entered(body):
	game_over()

func _on_visible_on_screen_notifier_2d_screen_exited():
	game_over()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	show()
	$CollisionShape2D.set_deferred("disabled",false)
