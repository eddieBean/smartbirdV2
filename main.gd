extends Node2D

@export var pipe_scene: PackedScene

var score

func _ready():
	new_game()

func new_game():
	score = 0
	$HUD.startMessage()
	$Bird.start($startPosition.position)
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
	
func _increase_score():
	score += 1
	$HUD.update_score(score/24)


func _on_bird_hit() -> void:
	get_tree().call_group("pipes", "queue_free")
	$PipeSpawnTimer.stop()
	$HUD.message("U died lmao")
	
	print("game over")
	
