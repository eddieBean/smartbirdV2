extends Node2D

@export var pipe_scene: PackedScene

signal game_over

var score

func _ready():
	#new_game()
	pass
	
func new_game():
	score = 0
	$Bird.start($startPosition.global_position)
	show()
	$HUD.update_score(0)
	$HUD.startMessage()
	$PipeSpawnTimer.start()

func _on_pipe_spawn_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	var pipe_spawn_location = $PipePath/PipeSpawnLocations
	pipe_spawn_location.progress_ratio = randf()
	pipe.position = pipe_spawn_location.position
	var velocity = Vector2(-100.0,0.0)
	pipe.set_velocity(velocity)
	add_child(pipe)
	pipe.player_detected.connect(_increase_score)
	
func _increase_score(name):
	if name == "Bird":
		score += 1
		$HUD.update_score(score)


func _on_bird_hit():
	get_tree().call_group("pipes", "queue_free")
	$PipeSpawnTimer.stop()
	$Bird.position = ($startPosition.position)
	$Bird.sleeping = true
	$HUD.message("game over man")
	$HUD/scoreLabel.text = ""
	await get_tree().create_timer(1.5).timeout
	game_over.emit()

#func _on_visibility_changed():
	#$HUD.visible = visible
