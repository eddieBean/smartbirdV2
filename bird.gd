extends RigidBody2D

signal hit

var screen_size

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

#func _on_body_entered(body):
	#print("touched wall!!")
	#game_over()

func _on_visible_on_screen_notifier_2d_screen_exited():
	print("exited screen")
	game_over()

func _on_visible_on_screen_notifier_2d_screen_entered():
	print("showing on screen")
	show()


#func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	#print("touched wall!!")
	#game_over()


#func _on_bird_area_body_entered(body: Node2D):
	#if body.name == "TopPipeCollider" or body.name == "BottomPipeCollider":
		#hit.emit()
