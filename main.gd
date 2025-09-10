extends Node2D

@export var pipe_scene: PackedScene

var score

func _ready():
	new_game()

func new_game():
	score = 0
	$Bird.start($startPosition.position)
	$PipeSpawnTimer.start()

func _on_pipe_spawn_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	
	var pipe_spawn_location = $PipePath/PipeSpawnLocations
	pipe_spawn_location.progress_ratio = randf()
	
	pipe.position = pipe_spawn_location.position
	
	pipe.linear_velocity = Vector2(-100.0,0.0)
	add_child(pipe)
