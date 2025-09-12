extends RigidBody2D

signal hit

var screen_size

var ID

func start(pos):
	
	position = pos
	gravity_scale = 1
	show()

func _ready():
	screen_size = get_viewport_rect().size
	contact_monitor = true
	gravity_scale = 0
	
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		linear_velocity = Vector2(0.0,-450.0)

func game_over():
	hit.emit()
	hide()
	print("detected game over")

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("exited screen")
	game_over()

func _on_visible_on_screen_notifier_2d_screen_entered():
	print("showing on screen")
	show()
